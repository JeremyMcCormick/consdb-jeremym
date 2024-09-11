#!/usr/bin/env python

#
# How to use this script:
# 1. Set the SDM_SCHEMAS_DIR environment variable to point to your sdm_schemas
#    tree. The schema yaml files should be in
#    $SDM_SCHEMAS_DIR/yml/cdb_latiss.yaml,
#    $SDM_SCHEMAS_DIR/yml/cdb_lsstcomcam.yaml, etc.
# 2. Load the LSST environment and setup felis.
#        source loadLSST.bash
#        setup felis
# 3. From the consdb root, invoke the script. Supply a revision message as the
#    command line argument:
#        python alembic-autogenerate.py this is my revision message
# 4. Heed the message at the end to revise your auto-generated code as needed.
#

import os
import sys

from alembic.config import Config
from alembic import command
from sqlalchemy.sql import text

from felis.tests.postgresql import setup_postgres_test_db

if len(sys.argv) <= 1:
    print()
    print("Usage:")
    print(f"    {sys.argv[0]} put a revision message here")
    print()
    sys.exit(1)

revision_message = ' '.join(sys.argv[1:])

# Configuration for Alembic
alembic_ini_path = "alembic.ini"

# Loop over each of the instruments
for instrument in ("latiss", "lsstcomcam", "lsstcomcamsim"):
    # Set up a temporary PostgreSQL instance using testing.postgresql
    with setup_postgres_test_db() as instance:
        os.environ["CONSDB_URL"] = instance.url
        # Create schema
        with instance.engine.connect() as connection:
            connection.execute(text("CREATE SCHEMA cdb;"))
            connection.execute(text(f"CREATE SCHEMA cdb_{instrument};"))
            connection.commit()

        # Initialize Alembic configuration
        alembic_cfg = Config(alembic_ini_path)
        alembic_cfg.set_main_option("sqlalchemy.url", instance.url)
        alembic_cfg.config_ini_section = instrument

        # Apply the HEAD schema to the database
        command.upgrade(alembic_cfg, "head")

        # Autogenerate a new migration
        command.revision(alembic_cfg, autogenerate=True, message=revision_message)

print()
print("="*42)
print(" Don't forget to edit your migration")
print(" files! You'll need to remove the visit1")
print(" and ccdvisit1 tables, and you might need")
print(" to shuffle data around to accomodate the")
print(" new schema!")
print("="*42)