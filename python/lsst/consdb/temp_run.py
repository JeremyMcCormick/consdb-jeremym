import argparse
import asyncio
from typing import Any

import lsst_efd_client
import yaml
from lsst.daf.butler import Butler
from sqlalchemy import create_engine

import logging
import sys
from pathlib import Path
import astropy.time
from efd_transform.transform_main import TransformMain

def get_logger(path, debug=True):


    # File Handler
    logfile = Path(path)
    formatter = logging.Formatter("%(asctime)s [%(levelname)s] %(message)s")
    file_handler = logging.FileHandler(logfile)
    file_handler.setFormatter(formatter)

    # Stdout handler
    consoleFormatter = logging.Formatter("[%(levelname)s] %(message)s")
    consoleHandler = logging.StreamHandler(sys.stdout)
    consoleHandler.setFormatter(consoleFormatter)

    log = logging.getLogger("transform")
    log.addHandler(file_handler)
    log.addHandler(consoleHandler)

    if debug:
        log.setLevel(logging.DEBUG)
    else:
        log.setLevel(logging.INFO)

    return log


def build_argparser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Summarize EFD topics in a time range")
    parser.add_argument(
        "-c", 
        "--config", 
        dest="config_name", 
        required=True, 
        help="config YAML")
    parser.add_argument(
        "-i",
        "--instrument",
        dest="instrument",
        required=True,
        help="instrument name",
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
    parser.add_argument(
        "-r",
        "--repo",
        dest="repo",
        default="/repo/embargo",
        required=True,
        help="Butler repo",
    )
    parser.add_argument(
        "-d",
        "--db",
        dest="db_conn_str",
        default="sqlite://test.db",
        required=True,
        help="Consolidated Database connection string",
    )
    parser.add_argument(
        "-E",
        "--efd",
        dest="efd_conn_str",
        default="usdf_efd",
        required=True,
        help="EFD connection string",
    )

    parser.add_argument(
        "-l",
        "--logfile",
        dest="logfile",
        default="transform.log",
        help="Log file",
    )

    return parser

def read_config(config_name: str) -> dict[str, Any]:
    with open(config_name, "r") as f:
        return yaml.safe_load(f)


async def main() -> None:
    parser = build_argparser()
    args = parser.parse_args()

    log = get_logger(args.logfile)
    # log.info("----------- MAIN -----------")

    butler = Butler(args.repo)
    # log.debug(f"Butler: {butler}")

    db = create_engine(args.db_conn_str)
    # log.debug(f"DB engine: {db}")

    efd = lsst_efd_client.EfdClient(args.efd_conn_str)
    # log.debug(f"EFD: {efd}")

    config = read_config(args.config_name)
    # log.debug(f"Configs: {config}")

    tm = TransformMain(
        butler=butler,
        db = db, 
        efd = efd, 
        config = config, 
        logger=log)

    start_time = astropy.time.Time(args.start_time, format="isot")
    end_time = astropy.time.Time(args.end_time, format="isot")

    await tm.process_interval(
        args.instrument,
        start_time,
        end_time,
    )


if __name__ == "__main__":

    # Exemplo de execução
    # python transform_efd.py 
    # -i LATISS 
    # -s 2024-01-01T4:00:00  
    # -e 2024-01-05T05:00:00 
    # -r /repo/embargo 
    # -d sqlite://test.db 
    # -E usdf_efd -c test.yaml
    # -l $PWD/.tmp/transform.log
    asyncio.run(main())