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
3 - NORMALE FLATPAK UPDATER (UPDATE ALLE FLATPAK GEÏNSTALLEERDE APPS NAAR LAATSTE VERSIE)
4 - Sluit dit menu en ga terug naar het QGIS-MENU
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		tput setaf 5; echo "Voorbereiden om QGIS te installeren met update LATEST"
        sleep 2 ; sudo bash qgis/MUFU/Startup/QgisStartNL.sh
	tput reset
        ;;
	2 ) 
		tput setaf 5; echo "Voorbereiden om QGIS te installeren met update 3.6"
        sleep 2 ; sudo bash qgis/MUFU/Startup/QgisStart3.6NL.sh
	tput reset
	;;
	3 ) 
		tput reset
		sudo flatpak update
		tput setaf 2; echo "Updates voor Flatpak en zijn apps zijn voltooid"
		sleep 3
		tput reset
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
