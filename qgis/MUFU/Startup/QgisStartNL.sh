#!/bin/bash

#Terminal leegmaken voordat het script uitvoert
tput reset

#Oudere mappen verwijderen (indien gecreëerd)
sudo rm -rf qgis

#Commando's voor het doorvoeren naar de Installatie
mkdir qgis && cd qgis && sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/NL/QgisInstallerNL.sh && tput reset && tput bold && tput setaf 5; echo Installatie bestanden gedownload! && tput setaf 3; echo De installatie zal starten over 3 seconden && tput sgr 0 && sleep 3

#DIT IS HET DOORVERWIJSSCRIPT VOOR QGIS
sudo bash QgisInstallerNL.sh
