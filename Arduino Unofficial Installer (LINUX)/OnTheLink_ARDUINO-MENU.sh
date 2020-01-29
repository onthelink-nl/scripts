#!/bin/bash

tput reset
tput clear
selection=
until [ "$selection" = "5" ]; do
tput bold && tput setaf 46; echo "
OnTheLink ARDUINO-MENU | Version(s): 1.8.11 (64-32) | WARNING: DO NOT ATTEMPT TO INSTALL MULTIPLE ARDUINO INSTALLATIONS
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>>"
tput setaf 191; echo -n "STANDALONE OPTIONS"
tput setaf 45; echo "<<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
1 - Install Arduino 1.8.11 (64-32)
2 - Exit Script normally (RUN THIS ONE IF YOU DON'T WANT TO INSTALL STUFF)
3 - Remove Arduino from your system (OPENS NEW MENU WHERE YOU CAN CHOOSE THE VERSION)
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf arduinoinstaller1.8.11.sh
		tput setaf 5; echo "Preparing the Arduino 1.8.11 installation..."
        sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Arduino%20Unofficial%20Installer%20(LINUX)/arduino-1.8.11%20(64-32)/arduinoinstaller1.8.11.sh"
        sleep 2 ; bash arduinoinstaller1.8.11.sh
		sudo rm -rf /home/$USER/arduinoinstaller*
		sudo rm -rf "OnTheLink_ARDUINO-MENU.sh"
		tput sgr0
		tput reset
		tput clear
		exit
        ;;
	2 ) 
		sudo rm -rf /home/$USER/arduinoinstaller*
		sudo rm -rf "OnTheLink_ARDUINO-MENU.sh"
		tput sgr0
		tput reset
		tput clear
		exit
		;;
	3 ) 
		sudo rm -rf UNINSTALL-MENU.sh
		tput setaf 5; echo "Preparing Arduino Removal Menu..."
		sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Arduino%20Unofficial%20Installer%20(LINUX)/Uninstallers/UNINSTALL-MENU.sh"
		sleep 2 ; bash UNINSTALL-MENU.sh
		sudo rm -rf /home/$USER/UNINSTALL-MENU.sh
		sudo rm -rf "UNINSTALL-MENU.sh"
		tput sgr0
		tput reset
		tput clear
		exit
		;;
	* ) 
        tput setaf 202; echo "Please enter choice 1, 2, 3..."
		sleep 1 ; tput reset
esac
done
