#!/bin/bash

#MESSAGES
COLUMNS=$(tput cols)
echoa="OnTheLink QGIS-VERSIE_KEUZEMENU"
echob="1 - Installeer update "LATEST""
echoba="2 - Installeer update "3.6""
echobb="3 - NORMALE FLATPAK UPDATER"
echobc="4 - Ga terug naar het QGIS-MENU"
echoc="echo -n "Voer uw keuze in: ""
echod="Voorbereiden om QGIS te installeren met update LATEST"
echoe="Voorbereiden om QGIS te installeren met update 3.6"
echof="Updates voor Flatpak en zijn apps zijn voltooid"
echog="Voer alstublieft alleen de keuzes 1, 2, 3 of 4 in..."
echoz=""

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

tput reset
tput clear
selection=
until [ "$selection" = "4" ]; do
tput bold
tput setaf 46
#echoa
printf "%*s\n" $(((${#echoa}+$COLUMNS)/2)) "$echoa"
tput sgr0
tput setaf 45
#echob
printf "%*s\n" $(((${#echob}+$COLUMNS)/2)) "$echob"
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echoba"
printf "%*s\n" $(((${#echobb}+$COLUMNS)/2)) "$echobb"
printf "%*s\n" $(((${#echobc}+$COLUMNS)/2)) "$echobc"
tput setaf 6
#echoc
printf "%*s\n" $(((${#echoc}+$COLUMNS)/2)) "$echoc"
read -r selection
#echoz
printf "%*s\n" $(((${#echoz}+$COLUMNS)/2)) "$echoz"
case $selection in
    1 ) 
		sudo rm -rf /home/$USER/QgisStartNL.sh 2> /dev/null | exec 1> /dev/tty
		tput setaf 5
		#echod
		printf "%*s\n" $(((${#echod}+$COLUMNS)/2)) "$echod"
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
		#echoe
		printf "%*s\n" $(((${#echoe}+$COLUMNS)/2)) "$echoe"
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
		tput setaf 2
		#echof
		printf "%*s\n" $(((${#echof}+$COLUMNS)/2)) "$echof"
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
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_STRETCH_NL.sh
		bash OnTheLink_QGIS-MENU_STRETCH_NL.sh
		exit
		;;
    * ) 
        tput setaf 202
		#echog
		printf "%*s\n" $(((${#echog}+$COLUMNS)/2)) "$echog"
		sleep 1
		tput reset
		tput clear
		tput sgr0
		;;
esac
done

