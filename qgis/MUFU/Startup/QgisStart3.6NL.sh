#!/bin/bash

#Terminal leegmaken voordat het script uitvoert
tput reset

#Oudere mappen verwijderen (indien gecreëerd)
sudo rm -rf qgis

#Commando's voor het doorvoeren naar de Installatie
mkdir qgis && cd qgis && sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/NL/QgisInstaller3.6NL.sh && tput reset && tput bold && tput setaf 5; echo Installatie bestanden gedownload! && tput setaf 3; echo De installatie zal starten over 3 seconden && tput sgr 0 && sleep 3

#DIT IS HET DOORVERWIJSSCRIPT VOOR QGIS
sudo bash QgisInstaller3.6NL.sh
