#!/bin/bash

#Clear the Terminal
tput reset
tput clear
tput sgr0

STARTDIR="$(pwd)"

#Removing older folders (if created)
sudo rm -rf /home/"$name"/qgis

#Downloading script
mkdir /home/"$name"/qgis
cd /home/"$name"/qgis
tput reset
tput clear
tput sgr0
tput bold
tput setaf 5
echo "Installation files downloaded!"
tput setaf 3
echo "The script will start in 3 seconds"
tput sgr0
sleep 3

#Execute the script
bash OnTheLink_QGIS-MENU_EN.sh

#Remove files at end of execution
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis
sudo rm -rf OnTheLink_QGIS-MENU_EN.sh
