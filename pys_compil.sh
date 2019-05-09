dirstart=$(pwd)
echo 'Running python3:'
echo ' '

for file in $(find . -type f -name fichier.py) ; do
    echo $file
    dirf=$(dirname $file)
    cd $dirf/
    python3 fichier.py
    cd $dirstart/
    echo ' '
done

bash ~/scripts/pgfs_make_absolute_paths.sh
