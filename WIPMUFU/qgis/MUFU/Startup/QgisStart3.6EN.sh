#!/bin/bash

#Clear terminal before execution of the script
tput reset

#WaitingForStartScript
tput bold && tput setaf 3; echo The script will start in 3 seconds && tput sgr 0 && sleep 3

#Execute the script
sudo bash qgis/MUFU/EN/QgisInstaller3.6EN.sh
