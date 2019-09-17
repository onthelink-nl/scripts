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
3 - Exit to the QGIS-MENU
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf /home/$USER/QgisStartEN.sh
		tput setaf 5; echo "Preparing to install QGIS with update MUFU"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Startup/QgisStartEN.sh
        sleep 2 ; sudo bash QgisStartEN.sh
        ;;
	2 ) 
		sudo rm -rf /home/$USER/QgisStart3.6EN.sh
		tput setaf 5; echo "Preparing to install QGIS with update 3.6"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Startup/QgisStart3.6EN.sh
        sleep 2 ; sudo bash QgisStart3.6EN.sh
        ;;
	3 ) 
		tput reset
		exit
		;;
    * ) 
        tput setaf 202; echo "Please enter choice 1, 2 or 3..."
		sleep 1 ; tput reset
esac
done
