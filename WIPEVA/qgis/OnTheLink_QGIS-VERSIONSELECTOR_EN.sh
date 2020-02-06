#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

tput reset
tput clear
selection=
until [ "$selection" = "2" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-VERSIONSELECTOR
"
tput sgr0 && tput setaf 45; echo "
1 - Install update "LATEST"
2 - Install update "3.6"
3 - REGULAR FLATPAK UPDATER (SHOULD AUTOMATICALLY UPDATE ALL APPLICATIONS THAT ARE INSTALLED USING THIS SCRIPT)
4 - Exit to the QGIS-MENU
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf /home/$USER/QgisStartEN.sh 2> /dev/null | exec 1> /dev/tty
		tput setaf 5
		echo "Preparing to install QGIS with update LATEST"
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Startup/QgisStartEN.sh
        sleep 2
		sudo bash QgisStartEN.sh
		sudo rm -rf /home/$USER/QgisStartEN.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
        ;;
	2 ) 
		sudo rm -rf /home/$USER/QgisStart3.6EN.sh 2> /dev/null | exec 1> /dev/tty
		tput setaf 5
		echo "Preparing to install QGIS with update 3.6"
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Startup/QgisStart3.6EN.sh
        sleep 2
		sudo bash QgisStart3.6EN.sh
		sudo rm -rf /home/$USER/QgisStart3.6EN.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
        ;;
	3 ) 
		tput reset
		tput clear
		tput sgr0
		sudo flatpak update
		tput setaf 2
		echo "Updated Flatpak and it's apps"
		sleep 3
		tput reset
		tput clear
		tput sgr0
		;;
	4 ) 
		tput reset
		tput clear
		tput sgr0
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_EN.sh 2> /dev/null | exec 1> /dev/tty
		exit
		;;
    * ) 
        tput setaf 202
		echo "Please enter choice 1, 2 or 3..."
		sleep 1
		tput reset
		tput clear
		tput sgr0
		;;
esac
done
