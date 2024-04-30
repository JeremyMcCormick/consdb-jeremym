export DAF_BUTLER_REPOSITORY_INDEX=/sdf/group/rubin/shared/data-repos.yaml

python python/lsst/consdb/transform_efd.py -i LATISS -s 2024-01-01T4:00:00  -e 2024-01-05T05:00:00 -r /repo/embargo -d sqlite://test.db -E usdf_efd -c config.yaml