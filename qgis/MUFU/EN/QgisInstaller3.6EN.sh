#!/bin/bash

spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 1
    done
  done
}

echo "About to start the installer..."
sleep 2
echo "Here we go!!!"
sleep 1

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!
# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 0 15`

#Clear terminal before execution of the script
tput reset

#Remove older versions
tput bold && tput setaf 5; echo "Removing older versions..." && sudo flatpak uninstall org.qgis.qgis && exec 1> log.txt sudo apt-get --yes --assume-yes remove flatpak 2> /dev/null | exec 1> /dev/tty && crontab -r && tput sgr0

#Initializing Script
tput reset

#stop spinner
kill -9 $SPIN_PID

#Information about the creators and the script itself
tput setaf 2; echo The script is originally created by Misha Opstal and Leopold Siccama Hiemstra.
echo This script will install QGIS version 3.6 on your chromebook.
echo Flatpak is being used for the most important part of the installation!
tput bold; echo We are not the creators of QGIS or Flatpak and this is an unofficial script.
tput setaf 5; echo -n "Our website: "
echo -e '\e]8;;https://onthelink.nl\aOnTheLink\e]8;;\a'
echo -n "The Flatpak website: "
echo -e '\e]8;;https://flatpak.org\aFlatpak\e]8;;\a'
echo -n "The QGIS website: "
echo -e '\e]8;;https://qgis.org\aQGIS\e]8;;\a'
tput setaf 69; echo Thank you for using our script!
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We advise you to always have a stable internetconnection when using the script and never press ctrl+c during the installation... (When you do this there is a chance that you will have to reset the chromebook using powerwash or a recovery)" && tput sgr0

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#sending positive reaction
echo ";)"

# Start the Spinner:
spin &

# Make a note of its Process ID (PID):
SPIN_PID=$!

#Commands after user input
tput sgr0 && exec 1> log.txt sudo apt-get --yes update | exec 1> /dev/tty && tput setaf 5; echo "Installation of QGIS has begon:" && tput setaf 9; echo "Creating a temporary folder..." && mkdir qgisfiles && cd qgisfiles && tput sgr0 && tput setaf 2; echo "Temporary folder created!" && tput sgr0 && tput setaf 9; echo "Installing requirements..." && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes install wget apt-utils nautilus 2> /dev/null | exec 1> /dev/tty && tput setaf 2; echo "Requirements have been installed!" && tput sgr0 && tput setaf 9; echo "Installing Flatpak..." && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty && tput setaf 2; echo "Installed Flatpak!" && tput setaf 9; echo "Updating apt:" && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes update | exec 1> /dev/tty && tput setaf 2; echo "apt updated!" && tput sgr0 && tput setaf 9; echo "Installing QGIS..." && tput sgr0 && sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty && sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-nl/scripts/master/qgis/qgis.flatpakref 2> /dev/null && kill -9 $SPIN_PID && flatpak -y install qgis.flatpakref && tput reset && flatpak update --commit=f3e180bb9ddc0cc9fc304e899b7c71405d10db81a8200f3d34dfb6288fec15b9 org.qgis.qgis && tput bold && tput setaf 5; echo "QGIS 3.6 has been installed!!!" 2> /dev/tty && sleep 1 && tput sgr0 && tput setaf 1; echo "Exiting in 10 seconds..." && sleep 5 && tput setaf 1; echo "5" && sleep 1 && tput setaf 1; echo "4" && sleep 1 && tput setaf 1; echo "3" && sleep 1 && tput setaf 1; echo "2" && sleep 1 && tput setaf 1; echo "1" && sleep 1 && tput setaf 2; echo "Goodbye!" && sleep 1 && tput reset && exit