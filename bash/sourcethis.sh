#!/bin/bash

###
### Script for sourcing a ros environment 
###

# get starting directory
CWD=$(pwd)
DIR=$CWD
NOTFOUND=true

echo " "
while test $CWD != $HOME && $NOTFOUND ; do
	if [ -f "$CWD/devel/setup.bash" ] ;
	then
		source $CWD/devel/setup.bash
		echo "sourced $CWD/devel/setup.bash"
		NOTFOUND=false
	fi
	pushd .. > /dev/null
	CWD=$(pwd)
	
done
echo " "

if $NOTFOUND;
then
	echo "Not in catkin workspace, sourcing .bashrc"
	source ~/.bashrc
fi

pushd $DIR > /dev/null
