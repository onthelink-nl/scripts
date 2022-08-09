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
HEIGHT=0
WIDTH=0
exec 3>&1
selection=$(dialog \
    --backtitle "QGIS Installation - Created by OnTheLink" \
    --title "Update " \
    --clear \
    --ok-label "Continue" \
    --cancel-label "Cancel" \
    --menu "Select update to use \nPlease refer to the install guide for more information" $HEIGHT $WIDTH 0 \
    "1" "VOU" \
    "2" "EVA" \
    "3" "MUFU" \
    2>&1 1>&3)

case $selection in
    1 )
      tput setaf 2
      echo "Update VOU will be used for this installation!"
      sudo rm -rf OnTheLink_QGIS-MENU_EN_VOU.sh
      tput setaf 5
      echo "Preparing the QGIS-MENU (VOU)..."
      sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_EN_VOU.sh
      sleep 2
      bash OnTheLink_QGIS-MENU_EN_VOU.sh
      sudo rm -rf OnTheLink_QGIS-MENU_VOU.sh
      exit
      ;;
    2 )
      tput setaf 2
      echo "Update EVA will be used for this installation!"
      sudo rm -rf OnTheLink_QGIS-MENU_EN_EVA.sh
      tput setaf 5
      echo "Preparing the QGIS-MENU (EVA)..."
      sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_EN_EVA.sh
      sleep 2
      bash OnTheLink_QGIS-MENU_EN_EVA.sh
      sudo rm -rf OnTheLink_QGIS-MENU_EN.sh
      exit
      ;;
    3 )
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
      exit 255
      ;;
esac
