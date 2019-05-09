echo 'Converting svg files to pdf:'
echo ' '

for file in $(find . -type f -name \*.eps) ; do
    echo $file
    output=${file%.*}
    rsvg-convert -f pdf -o $output-svg-converted-to.pdf $filename
    echo ' '
done
