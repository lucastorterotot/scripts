for arg in "$@"; do
    directory=$(dirname $arg)
    argnoxyz=${arg%.*}
    file=$(basename $argnoxyz)
    
    tmp_script_name='tmp_vmd_script_for_'$file'.vmd'
    cat ~/scripts/vmd/visualization_state_to_use.vmd > $tmp_script_name
    
    oldxyzfile=$(grep -h 'mol new .*xyz' $tmp_script_name | grep -o '.* type' | grep -o '.*xyz' | grep -o '/.*')
    
    currentdir=$(pwd) ; cd $directory ; newxyzfile=$(pwd) ; cd $currentdir
    newxyzfile=$newxyzfile'/'$file'.xyz'
    
    sed -i "s|$oldxyzfile|$newxyzfile|g" $tmp_script_name
    oldxyzfile=$(basename $oldxyzfile) ; newxyzfile=$(basename $newxyzfile)
    sed -i "s|$oldxyzfile|$newxyzfile|g" $tmp_script_name

    
    if [ -e ~/VMD_1_9_3/usr/local/lib/vmd/tachyon_LINUXAMD64 ]; then
        render='~/VMD_1_9_3/usr/local/lib/vmd/tachyon_LINUXAMD64'
    else
        render='/usr/local/lib/vmd/tachyon_LINUXAMD64'
    fi
    
    echo 'render Tachyon vmdscene "'$render'" -aasamples 12 %s -format TARGA -o %s.tga -res 2048 2048' >> $tmp_script_name
    
    vmd -dispdev none -eofexit < $tmp_script_name
    
    convert vmdscene.tga $file'-vmdrender.png'
    rm vmdscene* &
    rm $tmp_script_name &
    wait
done

    
