#!/bin/bash

fp=$(pwd)

i=0
for file in $(ls $fp/data); do

    if [[ $file == *.crs ]]; then

        i=$((i+1))

    fi

done
echo "Total course records: $i"
