dotfiles
=================

This repository contains some files for configuring my Ubuntu environment.
Additionally, some helper scripts concerning ROS (www.ros.org) are in here.
Below are some useful commands that I tend to forget ;-)

Useful commands
=================
1. Manually mount a Windows Share using Samba from the command line
    - Prerequisites: `sudo apt-get install cifs-utils`
    - `sudo mount -t cifs //<SERVER>/<SHARE> <MOUNTPOINT> -o username=<USER>,domain=<DOMAIN>`
    - add your password, when asked in the prompt
