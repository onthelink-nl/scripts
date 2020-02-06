#!/bin/bash

#Get current user
name="$(logname)"

#Get current path (Required for completion removal of install files)
STARTDIR="$(pwd)"

#Terminal legen
tput reset
tput clear
tput sgr0

#Oudere mappen verwijderen (indien gecreëerd)
sudo rm -rf /home/"$name"/qgis

#Script Downloaden
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

#Script uitvoeren
MACHINE_VERSION=`cat /etc/debian_version`
case $MACHINE_VERSION in
9|9.1|9.2|9.3|9.4|9.5|9.6|9.7|9.8|9.9)
   # Stretch stuff here

##STRETCH CHECK VOLTOOID
tput setaf 2
echo "STRETCH GEVONDEN!"
sleep 2

##Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0
tput setaf 9
echo "Stretch versie downloaden..."
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/OnTheLink_QGIS-MENU_NL_STRETCH.sh
bash OnTheLink_QGIS-MENU_NL_STRETCH.sh
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis
sudo rm -rf OnTheLink_QGIS-MENU_NL_EVA.sh
tput reset
tput clear
tput sgr0
exit
;;
10|10.1|10.2|10.3|10.4|10.5|10.6|10.7|10.8|10.9)
   ## Buster stuff here

##BUSTER CHECK VOLTOOID
tput setaf 2
echo "BUSTER GEVONDEN!"
sleep 2

##Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0
tput setaf 9
echo "Buster versie downloaden..."
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/OnTheLink_QGIS-MENU_NL_BUSTER.sh
bash OnTheLink_QGIS-MENU_NL_BUSTER.sh
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis
sudo rm -rf OnTheLink_QGIS-MENU_NL_EVA.sh
tput reset
tput clear
tput sgr0
exit
;;
*)
## FAILSAFE
  tput setaf 3
  echo "Stretch en Buster niet gevonden, uw debian versie wordt nog niet ondersteunt..."
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
  sudo rm -rf OnTheLink_QGIS-MENU_NL_EVA.sh
  tput reset
  tput clear
  tput sgr0
  exit
;;
esac
