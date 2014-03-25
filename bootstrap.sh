#!/bin/bash
# I took it from https://github.com/abubeck/dotfiles
# mostly adapted from https://github.com/holman/dotfiles


link_files () {
    for source in `find ~/dotfiles -maxdepth 2 -name \*.symlink`
    do
        dest="$HOME/.`basename \"${source%.*}\"`"

        if [ -f $dest ] || [ -d $dest ]
        then

            if [ -f $dest\.backup ]
            then
              printf "Backup already existing \n"
            else
              printf "Backup of existing file \n"
              mv $dest $dest\.backup
              ln -s $source $dest
              printf "Installed $dest \n"
            fi

        fi

    done
}

link_files

./git/gitconfig_setup.bash

