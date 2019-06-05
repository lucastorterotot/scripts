#!/bin/bash
# pdflatex_complete_sequence.sh
nbcompilmax=5
for arg in "$@"; do
    directory=$(dirname $arg)
    argnotex=${arg%.*}
    file=$(basename $argnotex)
    pdflatex -draftmode $directory/$file
    sleep 0.25
    if [ -e $file.bcf ]; then biber $file ; fi &
    if [ -e $file.idx ]; then makeindex $file.idx ; fi &
    bash ~/scripts/feynmp_compil.sh &
    wait
    sleep 0.25
    pdflatex $directory/$file
    nbcompil=2
    while [[ $(grep -l $file.log -e 'Rerun to get cross-references right' -e 'undefined references' -e 'undefined on input line') == $file.log ]] && ((nbcompil < nbcompilmax)); do
        pdflatex $directory/$file
        ((nbcompil+=1))
    done
    printf '\n\t' ; printf $nbcompil ; printf ' compilations.\n\n'
    rm -f *.1 *.mp *.t1 &
    rm -f $file.aux $file.out $file.toc $file.lof $file.nav $file.snm $file.synctex.gz $file.maf $file.mtc $file.ptc $file.bcf $file.bbl $file.run.xml $file-blx.bib $file.idx $file.ilg $file.ind &
    rm -f $file-*.cpt &
    wait
done