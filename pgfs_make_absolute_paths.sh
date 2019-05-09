echo 'Corrections on pgf files:'
echo ' '
dirstart=$(pwd)
for file in $(grep --include="*-pyplot.pgf" -rlHm1 'pgfimage.*{.*pyplot-img.*png}') ; do
    cd $(dirname $file)
    directory=$(pwd)
    cd $dirstart
    for oldstring in $(grep -h 'pgfimage.*{.*pyplot-img.*png}' $file | grep -o {.*.png | grep -o ]{.*.png | grep -o {.*.png | grep -v '/' ) ; do
        pgffilename=${oldstring//\{}
        echo '  '$directory'/'$pgffilename
        sed -i "s|$pgffilename|$directory/$pgffilename|g" $file
    done
done
