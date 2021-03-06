#!/bin/bash

if [[ $EUID -ne 1000 ]]; then
   tput setaf 1
   echo "This script cannot be started using the "sudo" command"
   sleep 3
   tput reset
   tput clear
   tput sgr0
   exit 1
fi

sudo apt-get --yes --assume-yes install dialog 2> /dev/null | exec 1> /dev/tty

export NCURSES_NO_UTF8_ACS=1
dialog --title "Update " \
--backtitle "QGIS Installation - Created by OnTheLink" \
--yesno "Use newest update? \nPress No for update MUFU" 0 0

# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
case $response in
   0) 
      tput setaf 2
      echo "Update EVA will be used for this installation!"
      sudo rm -rf OnTheLink_QGIS-MENU_EN_EVA.sh
      sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_EN_EVA.sh
      sleep 2
      bash OnTheLink_QGIS-MENU_EN_EVA.sh
      sudo rm -rf OnTheLink_QGIS-MENU_EN.sh
      exit
      ;;
   1) 
      tput setaf 2
      echo "Update MUFU will be used for this installation!"
      sudo rm -rf OnTheLink_QGIS-MENU_EN_MUFU.sh
      tput setaf 5
      echo "Preparing the QGIS-MENU (MUFU)..."
      sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_EN_MUFU.sh
      sleep 2
      bash OnTheLink_QGIS-MENU_EN_MUFU.sh
      sudo rm -rf OnTheLink_QGIS-MENU_EN.sh
      exit
      ;;
   255) 
      tput setaf 1
      echo "[ESC] Button has been pressed, Installation will be aborted"
      sudo rm -rf OnTheLink_QGIS-MENU_EN.sh
      tput sgr0
      tput reset
      tput clear
      exit 255;;
esac
