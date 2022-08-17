#! /bin/bash

./generate-python-index.sh

aws s3 cp index.html s3://bitcathedrals.com/python/ --profile root

