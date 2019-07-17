#!/bin/bash

tput reset
selection=
until [ "$selection" = "0" ]; do
tput bold && tput setaf 4; echo "
OnTheLink MENU
"
tput sgr0 && tput setaf 1; echo "
1 - install/reïnstall QGIS
0 - Exit Script
"
    echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
        tput setaf 5; echo "Preparing to install QGIS"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/Startup/QgisStartEN.sh
        sleep 2 ; sudo bash QgisStartEN.sh
        ;;
    0 ) 
        exit
        ;;
    * ) 
        tput setaf 3; echo "Please enter 1 or 0"
esac
done
