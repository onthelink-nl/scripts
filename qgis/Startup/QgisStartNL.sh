#!/bin/bash

#Terminal leegmaken voordat het script uitvoert
tput reset

#Oudere mappen verwijderen (indien gecreëerd)
sudo rm -rf .qgis

#Commando's voor het doorvoeren naar de Installatie
mkdir .qgis && cd .qgis && sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/NL/QgisInstallerNL.OTL && tput reset && tput bold && tput setaf 5; echo Installatie bestanden gedownload! && tput setaf 3; echo Voer de verificatie code in over 3 seconden om verder te gaan && tput sgr 0 && sleep 3

#DIT IS HET DOORVERWIJSSCRIPT VOOR QGIS
openssl enc -d -aes-256-cbc -a -in QgisInstallerNL.OTL | sudo bash -
