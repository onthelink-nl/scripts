#!/bin/bash

#Clear terminal before execution of the script
tput reset

#Remove older versions
tput bold && tput setaf 5; echo "Removing older versions..." && exec 1> log.txt sudo apt-get --yes --assume-yes remove wget apt-utils nautilus 2> /dev/null | exec 1> /dev/tty && sudo flatpak uninstall org.qgis.qgis && exec 1> log.txt sudo apt-get --yes --assume-yes remove flatpak 2> /dev/null | exec 1> /dev/tty && crontab -r && tput sgr0

#Initializing Script
tput reset

#Information about the creators and the script itself
tput setaf 2; echo The script is originally created by Misha Opstal and Leopold Siccama Hiemstra.
echo This script will install QGIS on your chromebook.
echo Flatpak is being used for the most important part of the installation!
echo We are not the creators of QGIS or Flatpak and this is an unofficial script.
echo "Our website: https://onthelink.tk"
echo "The Flatpak website: https://flatpak.org"
echo Thank you for using our script!
tput bold && tput setaf 1; echo -----------------------------------
tput bold && tput setaf 5; echo           INSTALLATION STARTED
tput bold && tput setaf 1; echo -----------------------------------
tput sgr0 && tput setaf 4; echo "WARNING: We advise you to always have a stable internetconnection when using the script and never press ctrl+c during the installation... (When you do this there is a chance that you will have to reset the chromebook using powerwash or a recovery)" && tput sgr0

#Kill Switch, will be activated when ctrl+c is pressed (Sometimes the chromebooks need to be powerwashed or reset by a recovery to make QGIS work after this)
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        echo "** Kill Switch is activated" && reboot
}

for i in `seq 1 5`; do
    sleep 1
    echo -n "."
done

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#Commands after user input
echo ";)" && tput sgr0 && exec 1> log.txt sudo apt-get --yes update | exec 1> /dev/tty && tput setaf 5; echo "Installation of QGIS has begon:" && tput setaf 6; echo "Creating a temporary folder..." && mkdir qgisfiles && cd qgisfiles && tput sgr0 && tput setaf 2; echo "Temporary folder created!" && tput sgr0 && tput setaf 6; echo "Installing wget, apt-utils and nautilus..." && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes install wget apt-utils nautilus 2> /dev/null | exec 1> /dev/tty && tput setaf 2; echo "Installed wget, apt-utils and nautilus!" && tput sgr0 && tput setaf 6; echo "Installing Flatpak..." && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty && tput setaf 2; echo "Installed Flatpak!" && tput setaf 6; echo "Updating apt:" && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes update | exec 1> /dev/tty && tput setaf 2; echo "apt updated!" && tput sgr0 && tput setaf 6; echo "Installing QGIS..." && tput sgr0 && sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty && sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/qgis.flatpakref 2> /dev/null && flatpak -y install qgis.flatpakref && tput reset && tput bold && tput setaf 5; echo "QGIS has been installed!!!" 2> /dev/tty && sleep 1 && tput sgr0 && tput setaf 4; echo "Installing the new crontab..." 2> /dev/tty && crontab -l | { cat; echo "*/1 * * * * rsync -a /run/user/1000/doc/by-app/org.qgis.qgis /home/$USER"; } | crontab - && tput setaf 5; echo "New crontab has been installed!" && tput setaf 1; echo "Exiting in 10 seconds..." && sleep 5 && tput setaf 1; echo "5" && sleep 1 && tput setaf 1; echo "4" && sleep 1 && tput setaf 1; echo "3" && sleep 1 && tput setaf 1; echo "2" && sleep 1 && tput setaf 1; echo "1" && sleep 1 && tput setaf 2; echo "Goodbye!" && sleep 1 && exit
