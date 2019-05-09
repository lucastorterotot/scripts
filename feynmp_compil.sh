for file in $(find . -maxdepth 1 -type f -iname \*.mp) ; do
    mpost $file
done
