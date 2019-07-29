#!/bin/bash

tput reset
selection=
until [ "$selection" = "0" ]; do
tput bold && tput setaf 4; echo "
OnTheLink MENU
"
tput sgr0 && tput setaf 1; echo "
2 - install/reïnstall/update QGIS
1 - Exit Script and install the auto remove files in the /home/$USER/org.qgis.qgis folder on startup script
0 - Exit Script normally
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    2 ) 
		tput setaf 5; echo "Preparing to install QGIS"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/Startup/QgisStartEN.sh
        sleep 2 ; sudo bash QgisStartEN.sh
        ;;
	1 ) 
        echo 'sudo rm -r /home/$USER/org.qgis.qgis/*' >> ~/.bashrc
		exit
		;;
    0 ) 
        sudo rm -r /home/$USER/.qgis/*
		exit
        ;;
    * ) 
        tput setaf 3; echo "Please enter choice 1 or 0..."
		sleep 1 ; tput reset
esac
done
