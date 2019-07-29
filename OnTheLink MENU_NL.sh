#!/bin/bash

tput reset
selection=
until [ "$selection" = "3" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-MENU
"
tput sgr0 && tput setaf 45; echo "
1 - installeer/herinstalleer/update QGIS
2 - Sluit dit menu en installeer het automatisch verwijderen van bestanden script (Voor scholen, KIES DEZE OPTIE MAAR 1 KEER!!!!!!!)
3 - Sluit dit menu
"
    tput setaf 88; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		tput setaf 5; echo "Voorbereiden om QGIS te installeren"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/Startup/QgisStartNL.sh
        sleep 2 ; sudo bash QgisStartNL.sh
        ;;
	2 ) 
        echo "sudo rm -rf /home/$USER/org.qgis.qgis/*" >> /home/$USER/.bashrc
		echo "sudo rm -rf /run/user/1000/doc/by-app/org.qgis.qgis/*" >> /home/$USER/.bashrc
		sudo rm -rf /home/$USER/qgis
		sudo rm -rf "/home/$USER/QgisStartNL.sh"
		sudo rm -rf "/home/$USER/OnTheLink%20MENU_NL.sh"
		sudo rm -rf "/home/$USER/QgisStartEN.sh"
		sudo rm -rf "/home/$USER/OnTheLink%20MENU_EN.sh"
		exit
		;;
    3 ) 
        sudo rm -rf /home/$USER/qgis
		sudo rm -rf "/home/$USER/QgisStartNL.sh"
		sudo rm -rf "/home/$USER/OnTheLink%20MENU_NL.sh"
		sudo rm -rf "/home/$USER/QgisStartEN.sh"
		sudo rm -rf "/home/$USER/OnTheLink%20MENU_EN.sh"
		exit
        ;;
    * ) 
        tput setaf 202; echo "Voer alstublieft alleen de keuzes 1, 2 of 3 in..."
        sleep 1 ; tput reset
esac
done
