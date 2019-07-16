#!/bin/bash

#Clear terminal before execution of the script
tput reset

#Removing older folders (if created)
sudo rm -rf .qgis

#Download the script
mkdir .qgis && cd .qgis && sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/EN/QgisInstallerEN.OTL && tput reset && tput bold && tput setaf 5; echo Installation files downloaded! && tput setaf 3; echo Please fill in the verification code in 3 seconds to execute the script && tput sgr 0 && sleep 3

#Fill in verification code and execute script
openssl enc -d -aes-256-cbc -a -in QgisInstallerEN.OTL | sudo bash -
