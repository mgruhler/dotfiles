#!/bin/sh

source ~/git/miror_catkin/devel/setup.bash 

### MIROR
export MIROR_ROOT=~/git/miror_rosbuild

### ROS
export ROS_WORKSPACE=${MIROR_ROOT}
export ROS_PACKAGE_PATH=${MIROR_ROOT}:${ROS_PACKAGE_PATH}
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:${MORSE_ROS_TESTING}

### MORSE
export PATH=${MIROR_ROOT}/morse_install/bin:${PATH}
export PYTHONPATH=${MIROR_ROOT}/morse_install/lib/python3.2/dist-packages:${PYTHONPATH}
export MORSE_SRC_ROOT=${MIROR_ROOT}/morse
export MORSE_ROS_TESTING=${MORSE_SRC_ROOT}/testing/middlewares/ros

alias cmake_morse='cmake -DCMAKE_INSTALL_PREFIX=${MIROR_ROOT}/morse_install -DBUILD_CORE_SUPPORT=ON -DBUILD_DOC_SUPPORT=OFF -DBUILD_ROS_SUPPORT=ON -DPYMORSE_SUPPORT=ON -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3.2 ..'


### environment variables for startup
export ROBOT_ENV=miror_mockup_env
export ROBOT=miror_mini_robo_mach_walking
