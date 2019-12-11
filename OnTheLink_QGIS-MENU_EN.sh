#!/bin/bash

#Clear the Terminal
tput reset

#Removing older folders (if created)
sudo rm -rf qgis

#Downloading script
mkdir qgis && cd qgis && sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/OnTheLink_QGIS-MENU_EN.sh && tput reset && tput bold && tput setaf 5; echo Installation files downloaded! && tput setaf 3; echo The script will start in 3 seconds && tput sgr 0 && sleep 3

#Execute the script
bash OnTheLink_QGIS-MENU_EN.sh

#Remove files at end of execution
cd .. && sudo rm -rf qgis && sudo rm -rf OnTheLink_QGIS-MENU_EN.sh
