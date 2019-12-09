#!/bin/bash

#Clear terminal before execution of the script
tput reset

#WaitingForScriptStart
tput bold && tput setaf 3; echo The script will start in 3 seconds && tput sgr 0 && sleep 3

#Execute the script
sudo bash qgis/MUFU/EN/QgisInstallerEN.sh
