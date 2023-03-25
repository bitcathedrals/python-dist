#! /bin/bash

DRY_RUN=""

if [[ $1 == "dry" ]]
then
  DRY_RUN="--dryrun"
fi

aws s3 cp simple s3://python.codermattie.net/simple/ --profile root --recursive $DRY_RUN && mv simple/* remote/

