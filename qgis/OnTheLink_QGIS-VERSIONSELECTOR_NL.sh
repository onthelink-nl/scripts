#!/bin/bash

tput reset
selection=
until [ "$selection" = "2" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-VERSIE_KEUZEMENU
"
tput sgr0 && tput setaf 45; echo "
1 - Installeer update "LATEST"
2 - Installeer update "3.6"
3 - NORMALE FLATPAK UPDATER (UPDATE ALLE FLATPAK GEÏNSTALLEERDE APPS)
4 - Sluit dit menu en ga terug naar het QGIS-MENU
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf /home/$USER/QgisStartNL.sh
		tput setaf 5; echo "Voorbereiden om QGIS te installeren met update MUFU"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Startup/QgisStartNL.sh
        sleep 2 ; sudo bash QgisStartNL.sh
        ;;
	2 ) 
		sudo rm -rf /home/$USER/QgisStart3.6NL.sh
		tput setaf 5; echo "Voorbereiden om QGIS te installeren met update 3.6"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Startup/QgisStart3.6NL.sh
        sleep 2 ; sudo bash QgisStart3.6NL.sh
	3 ) 
		tput reset
		sudo flatpak update
		echo "Updated Flatpak and it's apps"
		sleep 3
		;;
	4 ) 
		tput reset
		exit
		;;
    * ) 
        tput setaf 202; echo "Voer alstublieft alleen de keuzes 1, 2 of 3 in..."
		sleep 1 ; tput reset
esac
done
