find . -type f -iname \*~ -delete &
find . -type f -iname \#*\# -delete &
find . -type f -iname .~\* -delete &
wait
