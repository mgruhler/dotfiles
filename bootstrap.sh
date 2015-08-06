#!/bin/bash
# I took it from https://github.com/abubeck/dotfiles
# mostly adapted from https://github.com/holman/dotfiles


link_files () {
    for source in `find ~/dotfiles -maxdepth 2 -name \*.symlink`
    do
	printf "Bootstraping $source\n"
        dest="$HOME/.`basename \"${source%.*}\"`"
        if [ -f $dest ] || [ -d $dest ]
        then

            if [ -f $dest\.backup ]
            then
              printf "Backup already existing \n"
            else
              printf "Backup of existing file \n"
              mv $dest $dest\.backup
            fi

        fi

        ln -s $source $dest
        printf "Installed $dest \n"

    done
}

link_files

