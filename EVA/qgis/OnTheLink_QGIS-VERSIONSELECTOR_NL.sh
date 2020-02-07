#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

tput reset
tput clear
selection=
until [ "$selection" = "4" ]; do
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
		sudo rm -rf /home/$USER/QgisStartNL.sh 2> /dev/null | exec 1> /dev/tty
		tput setaf 5
		echo "Voorbereiden om QGIS te installeren met update LATEST"
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Startup/QgisStartNL.sh
        sleep 2
		sudo bash QgisStartNL.sh
		sudo rm -rf /home/$USER/QgisStartNL.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
        ;;
	2 ) 
		sudo rm -rf /home/$USER/QgisStart3.6NL.sh 2> /dev/null | exec 1> /dev/tty
		tput setaf 5
		echo "Voorbereiden om QGIS te installeren met update 3.6"
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Startup/QgisStart3.6NL.sh
        sleep 2
		sudo bash QgisStart3.6NL.sh
		sudo rm -rf /home/$USER/QgisStart3.6NL.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
        ;;
	3 ) 
		tput reset
		tput clear
		tput sgr0
		sudo flatpak update
		tput setaf 2; echo "Updates voor Flatpak en zijn apps zijn voltooid"
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
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh 2> /dev/null | exec 1> /dev/tty
		exit
		;;
    * ) 
        tput setaf 202
		echo "Voer alstublieft alleen de keuzes 1, 2 of 3 in..."
		sleep 1
		tput reset
		tput clear
		tput sgr0
		;;
esac
done

