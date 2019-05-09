echo 'Converting eps files to pdf:'
echo ' '

for file in $(find . -type f -name \*.eps) ; do
    echo $file
    output=${file%.*}
    epstopdf --outfile=$output-eps-converted-to.pdf $file
    echo ' '
done
