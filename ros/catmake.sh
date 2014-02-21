#!/bin/bash

###
### Script for invoking catkin_make from everywhere inside a catkin_workspace 
###

# get starting directory
CWD=$(pwd)
DIR=$CWD
NOTFOUND=true


# search recursively through folders until we run into the homedirectory
while test $CWD != $HOME && $NOTFOUND ; do
	if [ -f "$CWD/devel/setup.bash" ] ;
	then
    echo " "
    echo "Invorking catkin make in $CWD"
    echo " "
    catkin_make
		NOTFOUND=false
	else	
		pushd .. > /dev/null
		CWD=$(pwd)
	fi
done

if $NOTFOUND;
then
	echo " "
	echo "Not within a catkin workspace!"
	echo " "
fi

# get back old working directory
pushd $DIR > /dev/null
