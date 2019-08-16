#!/bin/bash

tput reset
selection=
until [ "$selection" = "2" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-VERSIE_KEUZEMENU
"
tput sgr0 && tput setaf 45; echo "
1 - Installeer update MUFU
2 - Sluit dit menu en ga terug naar het QGIS-MENU
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf /home/$USER/QgisStartNL.sh
		tput setaf 5; echo "Voorbereiden om QGIS te installeren met update MUFU"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/master/qgis/MUFU/Startup/QgisStartNL.sh
        sleep 2 ; sudo bash QgisStartNL.sh
        ;;
	2 ) 
		tput reset
		exit
		;;
    * ) 
        tput setaf 202; echo "Voer alstublieft alleen de keuzes 1, 2 of 3 in..."
		sleep 1 ; tput reset
esac
done
