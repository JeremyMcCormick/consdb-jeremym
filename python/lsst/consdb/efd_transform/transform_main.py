import argparse
import asyncio
from typing import Any, Union, List

import lsst_efd_client
import yaml
from lsst.daf.butler import Butler
from sqlalchemy import Engine

import logging
import sys
from pathlib import Path
import astropy.time
from efd_transform.butler_dao import ButlerDao
import pandas
import numpy

class TransformMain:

    def __init__(self, 
                 butler: Butler, 
                 db: Engine, 
                 efd: lsst_efd_client.EfdClient, 
                 config: dict[str, Any], 
                 logger: logging.Logger):

        self.log = logger

        self.butler_dao = ButlerDao(butler)
        self.db = db
        self.efd = efd
        self.config = config

        self.log.info("----------- MAIN -----------")
        self.log.debug(f"DB engine: {self.db}")
        self.log.debug(f"EFD: {self.efd}")
        self.log.debug(f"Configs: {self.config}")


    async def process_interval(self, 
                instrument: str, 
                start_time: astropy.time.Time,
                end_time: astropy.time.Time, 
            ):

        self.log.info(f"Proccessing interval {start_time} - {end_time}")

        # Retrieves all exposures for the period
        exposures = self.butler_dao.exposures_by_period(
            instrument, start_time, end_time)
        
        # self.log.info(f"Exposures: {len(exposures)}")

        # Retrieves all visits for the period
        visits = self.butler_dao.visits_by_period(
            instrument, start_time, end_time)

        # self.log.info(f"Visits: {len(visits)}")

        # Identifies the period that will be used to consult the topics
        topic_interval = self.get_topic_interval(start_time, end_time, exposures, visits)            
        self.log.info(f"Topic interval: {topic_interval[0]} - {topic_interval[1]}")        

        # Iterates over the columns defined in the config.
        # for each column retrieves EFD topic information
        for column in self.config['columns']:
            # self.log.debug(column)
            self.log.info(f"Proccessing Column: {column['name']}")

            # Array com todos os topicos necessarios para esta coluna.
            # topics = [{'name': topic name, series: pandas.DataFrame}]
            topics = await self.topics_by_column(column, topic_interval)

            # self.log.debug(topics)
            # print(topics[0]["series"])
            # print(df.info(verbose=True))

            # TODO: Parei aqui acredito que aqui deve entrar a get_topic_correponding_indexes
            # correponding_indexes = self.get_topic_correponding_indexes(
            #     exposures,
            #     topic_time_array= NAO SEI COMO CRIAR ESTE PARAMETRO.
            # )

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
        for topic in column['topics']:
            topic_series = await self.get_efd_values(topic, topic_interval)
            data.append({"topic": topic['name'], "series": topic_series})
            self.log.debug(f"EFD Topic {topic['name']} return {len(topic_series)} rows")

        return data
        

    async def get_efd_values(self,
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

    def get_topic_interval(self, 
                            start_time: astropy.time.Time, 
                            end_time: astropy.time.Time,
                            exposures: list[dict], 
                            visits: list[dict]
                            ) -> list[astropy.time.Time]:

        min_topic_time = start_time
        max_topic_time = end_time

        for exposure in exposures:
            if exposure.timespan.end < end_time:
                min_topic_time = min(exposure.timespan.begin, min_topic_time)
                max_topic_time = max(exposure.timespan.begin, max_topic_time)
 
        for visit in visits:
            if visit.timespan.end < end_time:
                min_topic_time = min(visit.timespan.begin, min_topic_time)
                max_topic_time = max(visit.timespan.begin, max_topic_time)
       
        return [min_topic_time, max_topic_time]