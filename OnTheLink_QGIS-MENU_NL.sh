#!/bin/bash

if [[ $EUID -ne 1000 ]]; then
   tput setaf 1
   echo "Dit script kan niet starten met de "sudo" optie"
   sleep 3
   tput reset
   tput clear
   tput sgr0
   exit 1
fi

sudo apt-get --yes --assume-yes install dialog 2> /dev/null | exec 1> /dev/tty

export NCURSES_NO_UTF8_ACS=1
dialog --title "Update " \
--backtitle "QGIS Installatie - Created by OnTheLink" \
--yesno "Nieuwste update gebruiken? \nDruk op nee voor update MUFU" 0 0

# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
case $response in
   0) 
      tput setaf 2
      echo "Update EVA zal worden gebruikt!"
      sudo rm -rf OnTheLink_QGIS-MENU_NL_EVA.sh
      sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_NL_EVA.sh
      sleep 2
      bash OnTheLink_QGIS-MENU_NL_EVA.sh
      exit
      ;;
   1) 
      tput setaf 2
      echo "Update MUFU zal worden gebruikt!"
      sudo rm -rf OnTheLink_QGIS-MENU_NL_MUFU.sh
      tput setaf 5
      echo "Bezig met het QGIS-MENU (MUFU) voorbereiden..."
      sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_NL_MUFU.sh
      sleep 2
      bash OnTheLink_QGIS-MENU_NL_MUFU.sh
      exit
      ;;
   255) 
      tput setaf 1
      echo "[ESC] Knop is ingedrukt, Installatie wordt afgebroken"
      tput sgr0
      tput reset
      tput clear
      exit 255;;
esac
