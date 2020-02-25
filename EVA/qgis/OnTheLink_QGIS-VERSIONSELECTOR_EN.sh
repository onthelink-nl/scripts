#!/bin/bash

#MESSAGES
COLUMNS=$(tput cols)
echoa="OnTheLink QGIS-VERSIONSELECTOR"
echob="1 - Install update "LATEST""
echoba="2 - Install update "3.6""
echobb="3 - REGULAR FLATPAK UPDATER (SHOULD AUTOMATICALLY UPDATE ALL APPLICATIONS THAT ARE INSTALLED USING THIS SCRIPT)"
echobc="4 - Exit to the QGIS-MENU"
echoc="echo -n "Enter selection: ""
echod="Preparing to install QGIS with update LATEST"
echoe="Preparing to install QGIS with update 3.6"
echof="Updated Flatpak and it's apps"
echog="Please enter choice 1, 2 or 3..."
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
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echob"
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echoba"
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echobb"
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echobc"
tput setaf 6
#echoc
printf "%*s\n" $(((${#echoc}+$COLUMNS)/2)) "$echoc"
read -r selection
#echoz
printf "%*s\n" $(((${#echoz}+$COLUMNS)/2)) "$echoz"
case $selection in
    1 ) 
		sudo rm -rf /home/$USER/QgisStartEN.sh 2> /dev/null | exec 1> /dev/tty
		tput setaf 5
		#echod
		printf "%*s\n" $(((${#echod}+$COLUMNS)/2)) "$echod"
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Startup/QgisStartEN.sh
        sleep 2
		sudo bash QgisStartEN.sh
		sudo rm -rf /home/$USER/QgisStartEN.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
        ;;
	2 ) 
		sudo rm -rf /home/$USER/QgisStart3.6EN.sh 2> /dev/null | exec 1> /dev/tty
		tput setaf 5
		#echoe
		printf "%*s\n" $(((${#echoe}+$COLUMNS)/2)) "$echoe"
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Startup/QgisStart3.6EN.sh
        sleep 2
		sudo bash QgisStart3.6EN.sh
		sudo rm -rf /home/$USER/QgisStart3.6EN.sh 2> /dev/null | exec 1> /dev/tty
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
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_EN.sh 2> /dev/null | exec 1> /dev/tty
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
