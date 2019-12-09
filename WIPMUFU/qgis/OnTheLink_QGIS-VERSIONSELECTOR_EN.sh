#!/bin/bash

tput reset
selection=
until [ "$selection" = "2" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-VERSIONSELECTOR
"
tput sgr0 && tput setaf 45; echo "
1 - Install update "LATEST"
2 - Install update "3.6"
3 - REGULAR FLATPAK UPDATER (SHOULD AUTOMATICALLY UPDATE ALL APPLICATIONS RELATED TO FLATPAK TO THEIR LATEST VERSION)
4 - Exit to the QGIS-MENU
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		tput setaf 5; echo "Preparing to install QGIS with update LATEST"
        sleep 2 ; sudo bash qgis/MUFU/Startup/QgisStartEN.sh
	tput reset
        ;;
	2 ) 
		tput setaf 5; echo "Preparing to install QGIS with update 3.6"
        sleep 2 ; sudo bash qgis/MUFU/Startup/QgisStart3.6EN.sh
	tput reset
        ;;
	3 ) 
		tput reset
		sudo flatpak update
		tput setaf 2; echo "Updated Flatpak and it's apps"
		sleep 3
		tput reset
		;;
	4 ) 
		tput reset
		exit
		;;
    * ) 
        tput setaf 202; echo "Please enter choice 1, 2 or 3..."
		sleep 1 ; tput reset
esac
done
