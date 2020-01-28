#!/bin/bash

tput reset
tput clear
selection=
until [ "$selection" = "5" ]; do
tput bold && tput setaf 46; echo "
ARDUINO UNINSTALLER-MENU | Version(s): 1.8.11 (64-32)
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>>"
tput setaf 191; echo -n "STANDALONE OPTIONS"
tput setaf 45; echo "<<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
1 - Remove Arduino 1.8.11 from your system
2 - Exit Script normally (RUN THIS ONE IF YOU DON'T WANT TO INSTALL STUFF)
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf arduinouninstaller1.8.11.sh
		tput setaf 5; echo "Preparing the Arduino 1.8.11 uninstallation..."
        sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%2010.0.2/javainstaller10.sh"
        sleep 2 ; bash arduinouninstaller1.8.11.sh
		sudo rm -rf /home/$USER/arduinouninstaller1.8.11.sh
		sudo rm -rf "arduinouninstaller1.8.11.sh"
		tput sgr0
		tput reset
		tput clear
		exit
        ;;
	2 ) 
		sudo rm -rf /home/$USER/arduinouninstaller1.8.11.sh
		sudo rm -rf "arduinouninstaller1.8.11.sh"
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
