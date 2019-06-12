#!/bin/bash

dirstart=$(pwd)
echo "Running python files, default version is:"
python -V
echo ' '

for file in $(find . -type f -name fichier.py) ; do
    echo $file
    dirf=$(dirname $file)
    cd $dirf/
    if [[ -x fichier.py ]]
    then
        ./fichier.py
    else
        python fichier.py
    fi
    cd $dirstart/
    echo ' '
done

~/scripts/pgfs_make_absolute_paths.sh
