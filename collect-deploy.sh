#!/bin/bash

Locations=("
/home/albert/.bashrc 
/home/albert/.config/i3/config 
/home/albert/.config/i3status/config 
/home/albert/.config/alacritty/alacritty.yml 
/home/albert/.config/starship.toml
")

function collect () {
    # echo "${Locations[@]}"
    for files in $Locations
    do
        originalpath=$files
        oneup=$(basename $(dirname $originalpath))

        if [ $oneup = "albert" ]; then
            echo "Collecting ${originalpath}"
            rsync -a $originalpath dotfiles/
        else
            savepath="dotfiles/"$oneup"/"
            echo "Collecting ${originalpath}"
            rsync -a $originalpath $savepath
        fi

    done
}

function deploy () {
    echo "TODO!"

}

if [ $1 = "-collect" ]; then
    echo "Collecting ${Locations[@]}"
    collect
elif [ $1 = "-deploy" ]; then
    echo "Deploying ${ls dotfiles/*}"
    deploy
else
    echo "Input -collect or -deploy to use this script!"
fi