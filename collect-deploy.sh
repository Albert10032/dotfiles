#!/bin/bash

Locations=("
$HOME/.bashrc
$HOME/.bash_aliases
$HOME/.config/i3/config
$HOME/.config/i3status/config
$HOME/.config/alacritty/alacritty.yml
$HOME/.config/starship.toml
$HOME/.wallpapers/*
$HOME/.scripts/*
")

function collect () {
    for files in $Locations
    do
        originalpath=$files
        target="dotfiles/"${originalpath#$HOME}
        save_directory_path=$(dirname $target)

        echo "Collecing ${files}"

        mkdir -p $save_directory_path
        rsync -a $originalpath $target

    done
    echo "Finished collecting!"
}

readarray -d '' Storage < <(find dotfiles/ -type f)


# TODO: on the deploy function, create 2 versions of the i3status config (for laptop and desktop), 
# then on deployment deploy both and rename them based on hostname
function deploy () {    
    for files in $Storage
    do
        source=$files
        target="${HOME}/"${files#*/}
        target_path=$(dirname $target)

        echo "Deploying ${source}"

        mkdir -p $target_path
        rsync -a $source $target
    done
    
    if [ $HOSTNAME = 'alberts-laptop' ]; then
        mv $HOME/.config/i3status/config-laptop $HOME/.config/i3status/config
        echo "Laptop specific modifications made!!"
    fi

    echo "Finished deploying!"
}

if [ $1 = "-collect" ]; then
    collect
elif [ $1 = "-deploy" ]; then
    deploy
else
    echo "Input -collect or -deploy to use this script!"
fi
