#!/bin/bash

#Terminal leegmaken voordat het script uitvoert
tput reset

#Commando's voor het doorvoeren naar de Installatie
tput bold && tput setaf 3; echo De installatie zal starten over 3 seconden && tput sgr 0 && sleep 3

#DIT IS HET DOORVERWIJSSCRIPT VOOR QGIS
sudo bash qgis/MUFU/NL/QgisInstaller3.6NL.sh
