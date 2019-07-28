#!/bin/bash

tput reset
selection=
until [ "$selection" = "0" ]; do
tput bold && tput setaf 4; echo "
OnTheLink MENU
"
tput sgr0 && tput setaf 1; echo "
1 - installeer/herinstalleer/update QGIS
0 - Sluit dit menu
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
        tput setaf 5; echo "Voorbereiden om QGIS te installeren"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/Startup/QgisStartNL.sh
        sleep 2 ; sudo bash QgisStartNL.sh
        ;;
    0 ) 
        exit
        ;;
    * ) 
        tput setaf 3; echo "Voer alstublieft alleen de keuzes 1 of 0 in..."
        sleep 1 ; tput reset
esac
done
