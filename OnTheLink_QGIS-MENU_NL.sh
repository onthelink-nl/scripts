#!/bin/bash

#Terminal legen
tput reset

#Script Downloaden
mkdir qgis && cd qgis && sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/OnTheLink_QGIS-MENU_NL.sh && tput reset && tput bold && tput setaf 5; echo Installatie bestanden gedownload! && tput setaf 3; echo Het script zal starten over 3 seconden && tput sgr 0 && sleep 3

#Script uitvoeren
bash OnTheLink_QGIS-MENU_NL.sh

#Verwijder bestanden na uitvoering script
cd .. && sudo rm -rf qgis && sudo rm -rf OnTheLink_QGIS-MENU_NL.sh
