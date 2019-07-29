#!/bin/bash

#Clear terminal before execution of the script
tput reset

#Removing older folders (if created)
sudo rm -rf qgis

#Download the script
mkdir qgis && cd qgis && sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/MUFU/EN/QgisInstallerEN.sh && tput reset && tput bold && tput setaf 5; echo Installation files downloaded! && tput setaf 3; echo The script will start in 3 seconds && tput sgr 0 && sleep 3

#Execute the script
sudo bash QgisInstallerEN.sh