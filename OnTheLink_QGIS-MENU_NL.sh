#!/bin/bash

tput reset
selection=
until [ "$selection" = "4" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-MENU
"
tput sgr0 && tput setaf 45; echo "
1 - Installeer/herinstalleer/update QGIS
2 - Verwijder QGIS
3 - Sluit dit menu en installeer het automatisch verwijderen van bestanden script (Voor scholen en voor chromebooks met één account met meerdere personen)
4 - Sluit dit menu
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf /home/$USER/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5; echo "Het QGIS-VERSIE_KEUZEMENU voorbereiden..."
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        sleep 2 ; bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        ;;
	2 ) 
		tput reset
		tput setaf 1; echo "Verwijderen van QGIS gestart..."
		sudo flatpak uninstall -y org.qgis.qgis
		sudo apt-get --yes --assume-yes remove flatpak
		crontab -r
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/MUFU/.bashrc > /home/$USER/.bashrc
		sudo rm -rf "/run/user/1000/doc/by-app/org.qgis.qgis/*"
		sudo rm -rf "/home/$USER/org.qgis.qgis/*"
		sudo rm -rf "/home/$USER/org.qgis.qgis"
		tput reset
		;;
	3 ) 
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/MUFU/.bashrc > /home/$USER/.bashrc
		echo "sudo rm -rf /home/$USER/org.qgis.qgis/*" >> /home/$USER/.bashrc
		echo "sudo rm -rf /run/user/1000/doc/by-app/org.qgis.qgis/*" >> /home/$USER/.bashrc
		sudo rm -rf "/home/$USER/qgis"
		sudo rm -rf "/home/$USER/QgisStartNL.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "/home/$USER/QgisStartEN.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		tput reset
		exit
		;;
    4 ) 
        sudo rm -rf "/home/$USER/qgis"
		sudo rm -rf "/home/$USER/QgisStartNL.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "/home/$USER/QgisStartEN.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		tput reset
		exit
        ;;
    * ) 
        tput setaf 202; echo "Voer alstublieft alleen de keuzes 1, 2 of 3 in..."
        sleep 1 ; tput reset
esac
done
