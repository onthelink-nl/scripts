#!/bin/bash

#Terminal legen
tput reset
tput clear
tput sgr0

#Oudere mappen verwijderen (indien gecreëerd)
sudo rm -rf /home/"$name"/qgis

#Script Downloaden
mkdir qgis
cd qgis
tput reset
tput clear
tput sgr0
tput bold
tput setaf 5
echo "Installatie bestanden gedownload!"
tput setaf 3
echo "Het script zal starten over 3 seconden"
tput sgr0
sleep 3

#Script uitvoeren
bash OnTheLink_QGIS-MENU_NL.sh

#Verwijder bestanden na uitvoering script
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis
sudo rm -rf OnTheLink_QGIS-MENU_NL.sh
