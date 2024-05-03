import argparse
from typing import TYPE_CHECKING, Any, Callable, Optional

import astropy.time
import lsst_efd_client
import pandas
import yaml
from lsst.daf.butler import Butler, DimensionRecord
from sqlalchemy import create_engine, Engine
import asyncio

class Summary:
    # TODO define summary
    pass


# TODO add all summarizing functions
def gen_mean(
    config: dict[str, Any]
) -> Callable[[pandas.DataFrame, astropy.time.Time, astropy.time.Time], Summary]:
    def do(
        series: pandas.DataFrame, start: astropy.time.Time, end: astropy.time.Time
    ) -> Summary:
        return Summary()

    return do


FUNCTION_GENERATORS = dict(mean=gen_mean)


class EfdValues:
    def __init__(
        self,
        config: dict[str, Any],
        window: astropy.time.TimeDelta,
        series: pandas.DataFrame,
    ):
        self._entries = series
        self._sum_function = FUNCTION_GENERATORS[config["function"]](config)
        self._window = window

    def summarize(self, start: astropy.time.Time, end: astropy.time.Time) -> Any:
        return self._sum_function(
            self._entries, start - self._window, end + self._window
        )


class Records:
    def __init__(self, db: Engine):
        self._db = db

    def add(
        self, dim: DimensionRecord, topic: dict[str, Any], summary: Any
    ) -> None:
        pass

    def write(self, table: str) -> None:
        pass


def read_config(config_name: str) -> dict[str, Any]:
    with open(config_name, "r") as f:
        return yaml.safe_load(f)


async def get_efd_values(
    efd: lsst_efd_client.EfdClient,
    topic: dict[str, Any],
    start: astropy.time.Time,
    end: astropy.time.Time,
) -> pandas.DataFrame:
    window = astropy.time.TimeDelta(topic.get("window", 0.0), format="sec")
    series = await efd.select_time_series(
        topic["name"],
        topic["fields"],
        start.utc - window,
        end.utc + window,
        topic.get("index", None),
    )
    series.to_csv('.tmp/' + topic['name'] + '.csv')
    print(f"Topic: {topic['name']}")
    # print(f"Window: {window}")
    # print(f"Series: {len(series)}")
    # print(series)

    return EfdValues(topic, window, series)


def get_exposures_by_period(butler: Butler, instrument: str, start: astropy.time.Time, end: astropy.time.Time, limit: Optional[int] = None):

    where_clause = f"instrument=instr and exposure.timespan OVERLAPS (T'{start}', T'{end}')"
    return butler.registry.queryDimensionRecords(
        "exposure", 
        where=where_clause,
        bind=dict(instr=instrument)
    ).limit(limit)

def get_visits_by_period(butler: Butler, instrument: str, start: astropy.time.Time, end: astropy.time.Time, limit: Optional[int] = None):

    where_clause = f"instrument=instr and visit.timespan OVERLAPS (T'{start}', T'{end}')"
    return butler.registry.queryDimensionRecords(
        "visit", 
        where=where_clause,
        bind=dict(instr=instrument)
    ).limit(limit)

def butler_query_results_to_pandas(query):
    return pandas.DataFrame([q.toDict() for q in query])

async def process_interval(
    butler: Butler,
    db: Engine,
    efd: lsst_efd_client.EfdClient,
    config: dict[str, Any],
    instrument: str,
    start_time: str,
    end_time: str,
) -> None:

    print(f"Process Interval")   

    start = astropy.time.Time(start_time, format="isot")
    end = astropy.time.Time(end_time, format="isot")

    print(f"start: {start}")
    print(f"end: {end}")

    exposure_list = []
    visit_list = []
    min_topic_time = end
    max_topic_time = start

    for record in get_exposures_by_period(butler, instrument, start, end, limit=10):
        if record.timespan.end < end:
            exposure_list.append(record)
            min_topic_time = min(record.timespan.begin, min_topic_time)
            max_topic_time = max(record.timespan.begin, max_topic_time)        

    for record in get_visits_by_period(butler, instrument, start, end, limit=10):
        if record.timespan.end < end:
            visit_list.append(record)
            min_topic_time = min(record.timespan.begin, min_topic_time)
            max_topic_time = max(record.timespan.begin, max_topic_time)        

    print(f"Exposures: {len(exposure_list)}")
    print(f"Visits: {len(visit_list)}")
    print(f"Min Topic time: {min_topic_time}")
    print(f"Max Topic time: {max_topic_time}")


    # exposure_records = Records(db)
    # print("Exposure Records:")
    # print(exposure_records)
    # visit_records = Records(db)
    # for topic in config["topics"]:
    #     efd_values = get_efd_values(efd, topic, min_topic_time, max_topic_time)
    #     for e in exposure_list:
    #         summary = efd_values.summarize(e.timespan.begin, e.timespan.end)
    #         exposure_records.add(e, topic, summary)
    #     for v in visit_list:
    #         summary = efd_values.summarize(v.timespan.begin, v.timespan.end)
    #         visit_records.add(v, topic, summary)

    # exposure_records.write(config["exposure_table"])
    # visit_records.write(config["visit_table"])

    for topic in config["topics"]:
        efd_values = await get_efd_values(efd, topic, min_topic_time, max_topic_time)
        # print(efd_values)


def build_argparser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Summarize EFD topics in a time range")
    parser.add_argument(
        "-c", "--config", dest="config_name", required=True, help="config YAML"
    )
    parser.add_argument(
        "-i", "--instrument", dest="instrument", required=True, help="instrument name"
    )
    parser.add_argument(
        "-s",
        "--start",
        dest="start_time",
        required=True,
        help="start time (ISO, YYYY-MM-DDTHH:MM:SS)",
    )
    parser.add_argument(
        "-e",
        "--end",
        dest="end_time",
        required=True,
        help="end time (ISO, YYYY-MM-DDTHH:MM:SS)",
    )
    parser.add_argument("-r", "--repo", dest="repo", default="/repo/embargo", required=True, help="Butler repo")
    parser.add_argument(
        "-d",
        "--db",
        dest="db_conn_str",
        default="sqlite://test.db",
        required=True,
        help="Consolidated Database connection string",
    )
    parser.add_argument(
        "-E", "--efd", dest="efd_conn_str", default="usdf_efd", required=True, help="EFD connection string"
    )
    return parser


async def main() -> None:
    print("----------- MAIN -----------")
    parser = build_argparser()
    args = parser.parse_args()

    butler = Butler(args.repo)
    print(f"Butler: {butler}")

    db = create_engine(args.db_conn_str)
    print(f"DB engine: {db}")

    efd = lsst_efd_client.EfdClient(args.efd_conn_str)
    print(f"EFD: {efd}")

    config = read_config(args.config_name)
    # print(f"Configs: {config}")   

    await process_interval(
        butler, db, efd, config, args.instrument, args.start_time, args.end_time
    )


if __name__ == "__main__":

    # Exemplo de execução
    # python transform_efd.py -i LATISS -s 2024-01-01T4:00:00  -e 2024-01-05T05:00:00 -r /repo/embargo -d sqlite://test.db -E usdf_efd -c test.yaml
    asyncio.run(main())
    
