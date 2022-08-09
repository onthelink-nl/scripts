#!/bin/bash

#Get current user
name="$(logname)"

#Install Dialog
sudo apt-get --yes --assume-yes install dialog 2> /dev/null | exec 1> /dev/tty

#Get current path (Required for completion removal of install files)
STARTDIR="$(pwd)"

#Clear Terminal
tput reset
tput clear
tput sgr0

#Removing older folders (if created)
sudo rm -rf /home/"$name"/qgis

#Download Script
mkdir /home/"$name"/qgis
cd /home/"$name"/qgis
tput reset
tput clear
tput sgr0
tput bold
tput setaf 5
echo "Installation can now continue!"
tput setaf 3
echo "The script will start in 3 seconds"
tput sgr0
sleep 3

#Script execution
MACHINE_VERSION=`cat /etc/debian_version`
case $MACHINE_VERSION in
11|11.1|11.2|11.3|11.4|11.5|11.6|11.7|11.8|11.9)
## Bullseye stuff here

##BUSTER CHECK COMPLETED
tput setaf 2
echo "BUSTER FOUND!"
sleep 2

##Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0
tput setaf 9
echo "Downloading bullseye version..."
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/OnTheLink_QGIS-MENU_EN_BULLSEYE.sh
bash OnTheLink_QGIS-MENU_EN_BULLSEYE.sh
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis
sudo rm -rf OnTheLink_QGIS-MENU_EN_VOU.sh
tput reset
tput clear
tput sgr0
exit
;;
*)
## FAILSAFE
  tput setaf 3
  echo "Bullseye not found, please refer to the installation guide for more information..."
  sleep 1
  tput setaf 1
  echo "4"
  sleep 1
  tput setaf 1
  echo "3"
  sleep 1
  tput setaf 1
  echo "2"
  sleep 1
  tput setaf 1
  echo "1"
  cd $STARTDIR
  sudo rm -rf /home/"$name"/qgis
  sudo rm -rf OnTheLink_QGIS-MENU_EN_VOU.sh
  tput reset
  tput clear
  tput sgr0
  exit
;;
esac
