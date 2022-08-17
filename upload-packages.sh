#! /bin/bash

DRY_RUN=""

if [[ $1 == "dry" ]]
then
  DRY_RUN="--dryrun"
fi

cd local && aws s3 cp . s3://bitcathedrals.com/python/ --profile root --recursive $DRY_RUN
