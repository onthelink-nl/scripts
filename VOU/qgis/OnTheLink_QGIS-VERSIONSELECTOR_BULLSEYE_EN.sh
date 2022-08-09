#!/bin/bash

export NCURSES_NO_UTF8_ACS=1

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

tput reset
tput clear

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
exec 3>&1
selection=$(dialog \
    --backtitle "QGIS Versionselector - Created by OnTheLink" \
    --title "Versionselector" \
    --clear \
    --nocancel \
    --ok-label "Continue" \
    --cancel-label "Cancel" \
    --menu "OnTheLink_QGIS-VERSIONSELECTOR | VOU-BULLSEYE | All Options" $HEIGHT $WIDTH 0 \
    "1" "Install update "LATEST"" \
    "2" "Install update "1.0"" \
    "3" "REGULAR FLATPAK UPDATER" \
    "4" "Exit to the QGIS-MENU" \
    2>&1 1>&3)

case $selection in
    1 )
      sudo rm -rf /home/$USER/QgisStartEN.sh 2> /dev/null | exec 1> /dev/tty
        	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Startup/QgisStartEN.sh
        	sleep 2
		bash QgisStartEN.sh
		sudo rm -rf /home/$USER/QgisStartEN.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
		;;
    2 )
      sudo rm -rf /home/$USER/QgisStart1.0EN.sh 2> /dev/null | exec 1> /dev/tty
        	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Startup/QgisStart1.0EN.sh
        	sleep 2
		bash QgisStart1.0EN.sh
		sudo rm -rf /home/$USER/QgisStart1.0EN.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
		;;
    3 )
      tput reset
		tput clear
		tput sgr0
		flatpak --user update
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
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_EN.sh 2> /dev/null | exec 1> /dev/tty
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/OnTheLink_QGIS-MENU_EN_BULLSEYE.sh
		bash OnTheLink_QGIS-MENU_EN_BULLSEYE.sh
		exit
		;;
  esac
  
response=$?
case $response in
   1) 
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_EN.sh
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput setaf 1
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_EN.sh
      echo "[ESC] Button has been pressed, Removal will be aborted"
      tput sgr0
      tput reset
      tput clear
      exit 255;;
esac
