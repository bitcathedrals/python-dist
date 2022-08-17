#! /bin/bash

./upload-packages.sh

mv local/* remote/

./upload-index.sh


