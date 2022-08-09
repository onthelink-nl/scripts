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
    --backtitle "QGIS Versie_keuzemenu - Gemaakt door OnTheLink" \
    --title "Versie_keuzemenu" \
    --clear \
    --nocancel \
    --ok-label "Ga verder" \
    --cancel-label "Annuleer" \
    --menu "OnTheLink_QGIS-VERSIE_KEUZEMENU | VOU-BULLSEYE | Alle Opties" $HEIGHT $WIDTH 0 \
    "1" "Installeer update "LATEST"" \
    "2" "Installeer update "1.0"" \
    "3" "NORMALE FLATPAK UPDATER" \
    "4" "Ga terug naar het QGIS-MENU" \
    2>&1 1>&3)

case $selection in
    1 )
      sudo rm -rf /home/$USER/QgisStartNL.sh 2> /dev/null | exec 1> /dev/tty
        	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Startup/QgisStartNL.sh
        	sleep 2
		bash QgisStartNL.sh
		sudo rm -rf /home/$USER/QgisStartNL.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
		;;
    2 )
      sudo rm -rf /home/$USER/QgisStart1.0NL.sh 2> /dev/null | exec 1> /dev/tty
        	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Startup/QgisStart1.0NL.sh
        	sleep 2
		bash QgisStart1.0NL.sh
		sudo rm -rf /home/$USER/QgisStart1.0NL.sh 2> /dev/null | exec 1> /dev/tty
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
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh 2> /dev/null | exec 1> /dev/tty
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
		bash OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
		exit
		;;
  esac
  
response=$?
case $response in
   1) 
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput setaf 1
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
      echo "[ESC] Button has been pressed, Removal will be aborted"
      tput sgr0
      tput reset
      tput clear
      exit 255;;
esac
