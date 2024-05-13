import argparse
import asyncio
import logging
import sys
from pathlib import Path
from typing import Any, List, Union

import astropy.time
import lsst_efd_client
import numpy
import pandas
import yaml
from efd_transform.butler_dao import ButlerDao
from efd_transform.transform import Transform
from lsst.daf.butler import Butler
from sqlalchemy import Engine


class TransformMain:

    def __init__(
        self,
        butler: Butler,
        db: Engine,
        efd: lsst_efd_client.EfdClient,
        config: dict[str, Any],
        logger: logging.Logger,
    ):

        self.log = logger

        self.butler_dao = ButlerDao(butler)
        self.db = db
        self.efd = efd
        self.config = config

        self.log.info("----------- MAIN -----------")
        self.log.debug(f"DB engine: {self.db}")
        self.log.debug(f"EFD: {self.efd}")
        self.log.debug(f"Configs: {self.config}")

    async def process_interval(
        self,
        instrument: str,
        start_time: astropy.time.Time,
        end_time: astropy.time.Time,
    ):

        self.log.info(f"Proccessing interval {start_time} - {end_time}")

        # Retrieves all exposures for the period
        exposures = self.butler_dao.exposures_by_period(instrument, start_time, end_time)

        self.log.info(f"Exposures: {len(exposures)}")

        # Retrieves all visits for the period
        visits = self.butler_dao.visits_by_period(instrument, start_time, end_time)

        self.log.info(f"Visits: {len(visits)}")

        # Identifies the period that will be used to consult the topics
        topic_interval = self.get_topic_interval(start_time, end_time, exposures, visits)
        self.log.info(f"Topic interval: {topic_interval[0]} - {topic_interval[1]}")

        result_exp = {}
        for exposure in exposures:
            result_exp[exposure["id"]] = {
                "exposure_id": exposure["id"],
                "instrument": instrument,
                # "timespan": exposure['timespan'],
            }

        # self.log.info(result_exp)

        # Iterates over the columns defined in the config.
        # for each column retrieves EFD topic information
        for column in self.config["columns"]:
            # self.log.debug(column)
            self.log.info(f"Proccessing Column: {column['name']}")

            # Array with all topics needed for this column
            # topics = [{'name': topic name, series: pandas.DataFrame}]
            topics = await self.topics_by_column(column, topic_interval)

            for exposure in exposures:
                column_value = self.proccess_column_value(
                    start_time=exposure["timespan"].begin,
                    end_time=exposure["timespan"].end,
                    topics=topics,
                    transform_function=column["function"],
                )

                result_exp[exposure["id"]][column["name"]] = column_value

            # for visit in visits:
            #     column_value = self.proccess_column_value(
            #         start_time=visit['timespan'].begin,
            #         end_time=visit['timespan'].end,
            #         topics = topics,
            #         transform_function=column['function']
            #     )

            #     result_exp[visit['id']][column['name']] = column_value

        results = []
        for result_row in result_exp:
            results.append(result_exp[result_row])

        df = pandas.DataFrame(results[35:45])
        # self.log.info(df)
        print(df)

    def proccess_column_value(
        self, start_time: astropy.time.Time, end_time: astropy.time.Time, topics, transform_function
    ):

        topics_values = self.topic_values_by_exposure(start_time, end_time, topics)

        values = self.concatenate_arrays(topics_values)

        column_value = Transform(values).apply(transform_function)

        return column_value

    def topic_values_by_exposure(self, start_time: astropy.time.Time, end_time: astropy.time.Time, topics):

        topics_values = []

        for topic in topics:
            topic_table = topic["series"]
            values = topic_table.loc[
                (topic_table.index > str(start_time)) & (topic_table.index < str(end_time))
            ]
            topics_values.append(values)

        return topics_values

    def concatenate_arrays(
        self, input_data: Union[List[float], List[List[float]], numpy.ndarray, List[numpy.ndarray]]
    ) -> numpy.ndarray:
        """
        Concatenates values from a list or list of lists or a numpy array or list of numpy arrays,
        returning a single flat numpy array.

        Args:
            input_data: Input data, can be a list of floats or list of lists of floats or a numpy array or list of numpy arrays.

        Returns:
            np.ndarray: Concatenated flat numpy array.
        """
        if isinstance(input_data, numpy.ndarray):
            return numpy.concatenate(input_data.flat)
        elif isinstance(input_data, list):
            flat_arrays = [
                numpy.array(arr).flat if isinstance(arr, numpy.ndarray) else numpy.array(arr).flatten()
                for arr in input_data
            ]
            return numpy.concatenate(flat_arrays)
        else:
            raise TypeError(
                "Input data must be a list or list of lists or a numpy array or list of numpy arrays."
            )

    def get_topic_correponding_indexes(
        self,
        butler_table: pandas.DataFrame,
        topic_time_array: Union[List, numpy.ndarray],
    ) -> List:
        """
        Returns a list of topic indexes corresponding to each row in the
        butler_table.
        It is assumed that the butler_table and the topic_time_array are
        sorted in time ascending order.

        Parameters:
        - butler_table (pandas.DataFrame): The input DataFrame containing
        the butler table.
        - topic_time_array (Callable[[list],numpy.ndarray]): A callable
        function that returns an array of topic timespans.

        Returns:
        - indexes (List): A list of lists, where each inner list contains the
        topic indexes corresponding to a row in the butler_table.
        """
        indexes = []
        topic_index, max_topic_index = 0, len(topic_time_array)

        # iterate over each butler_table row to find the corresponding
        # topic indexes to later perform tranformations
        for index, row in butler_table.iterrows():
            topic_indexes = []
            # always checks first max_topic_index as failsafe
            while (topic_index < max_topic_index) and (topic_time_array[topic_index] < row.timespan.begin):
                topic_index += 1
            while (topic_index < max_topic_index) and (topic_time_array[topic_index] < row.timespan.end):
                topic_indexes.append(topic_index)
                topic_index += 1
            indexes.append(topic_indexes)
        return indexes

    async def topics_by_column(self, column, topic_interval) -> list[dict]:

        data = []
        for topic in column["topics"]:
            # self.log.debug(topic)
            topic_series = await self.get_efd_values(topic, topic_interval)
            data.append({"topic": topic["name"], "series": topic_series})
            self.log.debug(f"EFD Topic {topic['name']} return {len(topic_series)} rows")

        return data

    async def get_efd_values(
        self,
        topic: dict[str, Any],
        topic_interval: list[astropy.time.Time],
    ) -> pandas.DataFrame:

        start = topic_interval[0].utc
        end = topic_interval[1].utc
        window = astropy.time.TimeDelta(topic.get("window", 0.0), format="sec")

        series = await self.efd.select_time_series(
            topic["name"],
            topic["fields"],
            start - window,
            end + window,
            topic.get("index", None),
        )

        # TODO: Fazendo um resample e interpolate Provisório.
        # Somente para simular que existe mais de uma mensagem
        # por periodo da exposição
        # e permitir que seja feito a sumarização.
        series = series.resample("10s", origin=series.index[0]).mean()
        series = series.interpolate(method="time")

        # print(series)
        # print(series.info(verbose=True))

        return series

    def get_topic_interval(
        self,
        start_time: astropy.time.Time,
        end_time: astropy.time.Time,
        exposures: list[dict],
        visits: list[dict],
    ) -> list[astropy.time.Time]:

        min_topic_time = start_time
        max_topic_time = end_time

        for exposure in exposures:
            if exposure["timespan"].end < end_time:
                min_topic_time = min(exposure["timespan"].begin, min_topic_time)
                max_topic_time = max(exposure["timespan"].begin, max_topic_time)

        for visit in visits:
            if visit["timespan"].end < end_time:
                min_topic_time = min(visit["timespan"].begin, min_topic_time)
                max_topic_time = max(visit["timespan"].begin, max_topic_time)

        return [min_topic_time, max_topic_time]
