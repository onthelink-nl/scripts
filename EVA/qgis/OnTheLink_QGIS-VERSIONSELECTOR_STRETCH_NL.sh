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
    --backtitle "QGIS Versie_keuzemenu - Created by OnTheLink" \
    --title "Versie_keuzemenu" \
    --clear \
    --nocancel \
    --ok-label "Ga verder" \
    --cancel-label "Annuleer" \
    --menu "OnTheLink_QGIS-VERSIE_KEUZEMENU | EVA-STRETCH | Alle Opties" $HEIGHT $WIDTH 0 \
    "1" "Installeer update "LATEST"" \
    "2" "Installeer update "3.6"" \
    "3" "NORMALE FLATPAK UPDATER" \
    "4" "Ga terug naar het QGIS-MENU" \
    2>&1 1>&3)

case $selection in
    1 )
      sudo rm -rf /home/$USER/QgisStartNL.sh 2> /dev/null | exec 1> /dev/tty
        	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Startup/QgisStartNL.sh
        	sleep 2
		bash QgisStartNL.sh
		sudo rm -rf /home/$USER/QgisStartNL.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		tput sgr0
		;;
    2 )
      sudo rm -rf /home/$USER/QgisStart3.6NL.sh 2> /dev/null | exec 1> /dev/tty
        	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Startup/QgisStart3.6NL.sh
        	sleep 2
		bash QgisStart3.6NL.sh
		sudo rm -rf /home/$USER/QgisStart3.6NL.sh 2> /dev/null | exec 1> /dev/tty
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
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_NL.sh 2> /dev/null | exec 1> /dev/tty
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_NL_STRETCH.sh
		bash OnTheLink_QGIS-MENU_NL_STRETCH.sh
		exit
		;;
  esac
  
response=$?
case $response in
   1) 
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_NL.sh
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput setaf 1
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_NL.sh
      echo "[ESC] Knop is ingedrukt, Installatie wordt afgebroken"
      tput sgr0
      tput reset
      tput clear
      exit 255;;
esac
