#!/bin/bash

###
### Script for sourcing a ros environment 
###

# get starting directory
CWD=$(pwd)
DIR=$CWD
NOTFOUND=true

echo " "

# search recursively through folders until we run into the homedirectory
while test $CWD != $HOME && $NOTFOUND ; do
	if [ -f "$CWD/devel/setup.bash" ] ;
	then
		source $CWD/devel/setup.bash
		echo "sourced $CWD/devel/setup.bash"
		NOTFOUND=false
	else	
		pushd .. > /dev/null
		CWD=$(pwd)
	fi
done

# if we didn't find a catkin workspace source bashrc, just in case
if $NOTFOUND;
then
	echo "Not in catkin workspace, sourcing .bashrc"
	source ~/.bashrc
fi

echo " "

# get back old workind directory
pushd $DIR > /dev/null
