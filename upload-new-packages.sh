#! /bin/bash

DRY_RUN=""

if [[ $1 == "dry" ]]
then
  DRY_RUN="--dryrun"
fi

aws s3 cp simple s3://python.bitcathedrals.com/simple/ --profile root --recursive $DRY_RUN
