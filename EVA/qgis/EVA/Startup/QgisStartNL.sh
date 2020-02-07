#!/bin/bash

#Get current user
name="$(logname)"

#Get current path (Required for completion removal of install files)
STARTDIR="$(pwd)"

#Clear terminal before execution of the script
tput reset
tput clear

#Oudere mappen verwijderen (indien gecreëerd)
sudo rm -rf /home/"$name"/qgis 2> /dev/null | exec 1> /dev/tty

#Download het script
mkdir /home/"$name"/qgis 2> /dev/null | exec 1> /dev/tty
cd /home/"$name"/qgis
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/NL/QgisInstallerNL.sh
tput reset
tput bold
tput setaf 5
echo Installatie bestanden gedownload!
tput setaf 3
echo De installatie zal starten over 3 seconden
tput sgr0
sleep 3

#DIT IS HET DOORVERWIJSSCRIPT VOOR QGIS
sudo bash QgisInstallerNL.sh
cd $STARTDIR
sudo rm -rf /home/"$name"/qgis 2> /dev/null | exec 1> /dev/tty
sudo rm -rf QgisStartNL.sh 2> /dev/null | exec 1> /dev/tty
tput reset
tput clear
tput sgr0
exit

