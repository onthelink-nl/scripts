#!/bin/bash

#Get current user
name="$(logname)"

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
9|9.1|9.2|9.3|9.4|9.5|9.6|9.7|9.8|9.9)
   # Stretch stuff here

##STRETCH CHECK COMPLETED
tput setaf 2
echo "STRETCH FOUND!"
sleep 2

##Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0
tput setaf 9
echo "Downloading stretch version..."
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/OnTheLink_QGIS-MENU_EN_STRETCH.sh
bash OnTheLink_QGIS-MENU_EN_STRETCH.sh
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis
sudo rm -rf OnTheLink_QGIS-MENU_EN_WIP.sh
tput reset
tput clear
tput sgr0
exit
;;
10|10.1|10.2|10.3|10.4|10.5|10.6|10.7|10.8|10.9)
   ## Buster stuff here

##BUSTER CHECK COMPLETED
tput setaf 2
echo "BUSTER FOUND!"
sleep 2

##Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0
tput setaf 9
echo "Downloading buster version..."
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/OnTheLink_QGIS-MENU_EN_BUSTER.sh
bash OnTheLink_QGIS-MENU_EN_BUSTER.sh
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis
sudo rm -rf OnTheLink_QGIS-MENU_EN_WIP.sh
tput reset
tput clear
tput sgr0
exit
;;
*)
## FAILSAFE
  tput setaf 3
  echo "Stretch and Buster not found, your debian version is not supported yet..."
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
  sudo rm -rf OnTheLink_QGIS-MENU_EN_WIP.sh
  tput reset
  tput clear
  tput sgr0
  exit
;;
esac
