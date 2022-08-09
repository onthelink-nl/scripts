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
echo "Alles is ingesteld, de installatie kan voortzetten!"
tput setaf 3
echo "Het script zal starten over 3 seconden"
tput sgr0
sleep 3

#Script execution
MACHINE_VERSION=`cat /etc/debian_version`
case $MACHINE_VERSION in
11|11.1|11.2|11.3|11.4|11.5|11.6|11.7|11.8|11.9)
## Bullseye stuff here

##BUSTER CHECK COMPLETED
tput setaf 2
echo "BULLSEYE GEVONDEN!"
sleep 2

##Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0
tput setaf 9
echo "Bullseye versie downloaden..."
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
bash OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis
sudo rm -rf OnTheLink_QGIS-MENU_NL_VOU.sh
tput reset
tput clear
tput sgr0
exit
;;
*)
## FAILSAFE
  tput setaf 3
  echo "Bullseye niet gevonden, voor meer info kunt u de handleiding raadplegen..."
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
  sudo rm -rf OnTheLink_QGIS-MENU_NL_VOU.sh
  tput reset
  tput clear
  tput sgr0
  exit
;;
esac
