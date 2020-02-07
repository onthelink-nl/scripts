#!/bin/bash

#Get current user
name="$(logname)"

#Get current path (Required for completion removal of install files)
STARTDIR="$(pwd)"

#Clear terminal before execution of the script
tput reset
tput clear

#Removing older folders (if created)
sudo rm -rf /home/"$name"/qgis 2> /dev/null | exec 1> /dev/tty

#Download the script
mkdir /home/"$name"/qgis 2> /dev/null | exec 1> /dev/tty
cd /home/"$name"/qgis
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/EN/QgisInstallerEN.sh
tput reset
tput bold
tput setaf 5
echo Installation files downloaded!
tput setaf 3
echo The script will start in 3 seconds
tput sgr0
sleep 3

#Execute the script
sudo bash QgisInstallerEN.sh
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis 2> /dev/null | exec 1> /dev/tty
sudo rm -rf QgisStartEN.sh 2> /dev/null | exec 1> /dev/tty
tput reset
tput clear
tput sgr0
exit
