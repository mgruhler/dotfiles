#!/bin/bash
# I took it from https://github.com/abubeck/dotfiles
# mostly adapted from https://github.com/holman/dotfiles


link_files () {
	for source in `find ~/dotfiles -maxdepth 2 -name \*.symlink`
  	do
  		dest="$HOME/.`basename \"${source%.*}\"`"

	    if [ -f $dest ] || [ -d $dest ]
	    then
	    	printf "Backup of existing file \n"
	    	mv $dest $dest\.backup
	    fi
	    ln -s $source $dest
      printf "Installed $dest \n"
	done
}

link_files

echo "raw3-1" > ~/.current_robot
echo "empty" > ~/.current_robot_env
echo "/opt/ros/groovy/" > ~/.current_ws
