#!/bin/bash

tput reset
selection=
until [ "$selection" = "0" ]; do
tput bold && tput setaf 4; echo "
OnTheLink MENU
"
tput sgr0 && tput setaf 1; echo "
2 - installeer/herinstalleer/update QGIS
1 - Sluit dit menu en installeer het automatisch verwijderen van bestanden in de /home/$USER/org.qgis.qgis map wanneer linux start script
0 - Sluit dit menu
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    2 ) 
		tput setaf 5; echo "Voorbereiden om QGIS te installeren"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/Startup/QgisStartNL.sh
        sleep 2 ; sudo bash QgisStartNL.sh
        ;;
	1 ) 
        echo "sudo rm -r /home/$USER/org.qgis.qgis/*" >> /home/$USER/.bashrc
		sudo rm -rf /home/$USER/qgis
		exit
		;;
    0 ) 
        sudo rm -rf /home/$USER/qgis
		exit
        ;;
    * ) 
        tput setaf 3; echo "Voer alstublieft alleen de keuzes 1 of 0 in..."
        sleep 1 ; tput reset
esac
done
