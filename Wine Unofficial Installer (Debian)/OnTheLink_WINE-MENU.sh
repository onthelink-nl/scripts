#!/bin/bash

tput reset
tput clear
selection=
until [ "$selection" = "5" ]; do
tput bold && tput setaf 46; echo "
OnTheLink WINE-MENU | Version(s): WINE (64) | WARNING: DO NOT ATTEMPT TO INSTALL MULTIPLE WINE INSTALLATIONS
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>>"
tput setaf 191; echo -n "STANDALONE OPTIONS"
tput setaf 45; echo "<<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
1 - Install Wine (64)
2 - Exit Script normally (RUN THIS ONE IF YOU DON'T WANT TO INSTALL STUFF)
3 - Remove Wine from your system
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf wineinstaller.sh
		tput setaf 5; echo "Preparing Wine installation..."
        sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Wine%20Unofficial%20Installer%20(Debian)/Wine/wineinstaller.sh"
        sleep 2 ; bash wineinstaller.sh
		sudo rm -rf /home/$USER/wineinstaller*
		sudo rm -rf "OnTheLink_WINE-MENU.sh"
		tput sgr0
		tput reset
		tput clear
		exit
        ;;
	2 ) 
		sudo rm -rf /home/$USER/wineinstaller*
		sudo rm -rf "OnTheLink_WINE-MENU.sh"
		tput sgr0
		tput reset
		tput clear
		exit
		;;
	3 ) 
		sudo rm -rf wineuninstaller.sh
		tput setaf 5; echo "Preparing Wine Removal..."
		sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Wine%20Unofficial%20Installer%20(Debian)/UNINSTALLER/wineuninstaller.sh"
		sleep 2 ; bash wineuninstaller.sh
    sudo rm -rf "wineuninstaller.sh"
    sudo rm -rf "OnTheLink_WINE-MENU.sh"
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
