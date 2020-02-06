#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

tput reset
tput clear
selection=
until [ "$selection" = "3" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-UPDATESELECTOR | Version: 3.1 STABLE
"
tput sgr0 && tput setaf 45; echo -n "
====================
>>>>>>>"
tput setaf 191; echo -n "OPTIONS"
tput setaf 45; echo "<<<<<<<
====================
"
tput sgr0 && tput setaf 202; echo "
1 - LATEST (EVA)
2 - MUFU (ONLY WORKS ON STRETCH (HAS NO STRETCH CHECKS!!))
3 - Exit
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf OnTheLink_QGIS-MENU_EN_EVA.sh
		tput setaf 5
		echo "Preparing the QGIS-MENU (EVA)..."
        sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_EN_EVA.sh
        sleep 2
		bash OnTheLink_QGIS-MENU_EN_EVA.sh
        ;;
	2 ) 
		sudo rm -rf OnTheLink_QGIS-MENU_EN_MUFU.sh
		tput setaf 5
		echo "Preparing the QGIS-MENU (MUFU)..."
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_EN_MUFU.sh
		sleep 2
		bash OnTheLink_QGIS-MENU_EN_MUFU.sh
		;;
  3 ) 
        tput reset
	tput clear
	tput sgr0
	sudo rm -rf OnTheLink_QGIS-MENU_EN.sh
        exit
        ;;
	* ) 
        tput setaf 202
		echo "Please only enter option 1, 2 or 3..."
		sleep 1
		tput reset
		;;
esac
done
