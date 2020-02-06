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
OnTheLink QGIS-UPDATEKEUZEMENU | Versie: 3.1 STABIEL
"
tput sgr0 && tput setaf 45; echo -n "
====================
>>>>>>>"
tput setaf 191; echo -n "OPTIES"
tput setaf 45; echo "<<<<<<<
====================
"
tput sgr0 && tput setaf 202; echo "
1 - LAATSTE (EVA)
2 - MUFU (WERKT ALLEEN OP STRETCH (HEEFT GEEN STRETCH CHECKS!!))
3 - Verlaat het script
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf OnTheLink_QGIS-MENU_NL_EVA.sh
		tput setaf 5
		echo "Bezig met het QGIS-MENU (EVA) voorbereiden..."
        sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_NL_EVA.sh
        sleep 2
		bash OnTheLink_QGIS-MENU_NL_EVA.sh
        ;;
	2 ) 
		sudo rm -rf OnTheLink_QGIS-MENU_NL_MUFU.sh
		tput setaf 5
		echo "Bezig met het QGIS-MENU (MUFU) voorbereiden..."
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_NL_MUFU.sh
		sleep 2
		bash OnTheLink_QGIS-MENU_NL_MUFU.sh
		;;
  3 ) 
        tput reset
	tput clear
	tput sgr0
	sudo rm -rf OnTheLink_QGIS-MENU_NL.sh
        exit
        ;;
	* ) 
        tput setaf 202
		echo "Voer alstublieft alleen de optie 1, 2 of 3 in..."
		sleep 1
		tput reset
		;;
esac
done
