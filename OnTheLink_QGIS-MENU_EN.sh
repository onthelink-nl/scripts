#!/bin/bash

tput reset
selection=
until [ "$selection" = "3" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-MENU
"
tput sgr0 && tput setaf 45; echo "
1 - install/reïnstall/update QGIS
2 - Exit Script and install the auto remove files script (For schools and for multiple users on one account people)
3 - Exit Script normally
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		tput setaf 5; echo "Preparing to install QGIS"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/MUFU/Startup/QgisStartEN.sh
        sleep 2 ; sudo bash QgisStartEN.sh
        ;;
	2 ) 
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/MUFU/.bashrc > /home/$USER/.bashrc
		echo "sudo rm -rf /home/$USER/org.qgis.qgis/*" >> /home/$USER/.bashrc
		echo "sudo rm -rf /run/user/1000/doc/by-app/org.qgis.qgis/*" >> /home/$USER/.bashrc
		sudo rm -rf /home/$USER/qgis
		sudo rm -rf "/home/$USER/QgisStartNL.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "/home/$USER/QgisStartEN.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-MENU_EN.sh"
		exit
		;;
    3 ) 
        sudo rm -rf /home/$USER/qgis
		sudo rm -rf "/home/$USER/QgisStartNL.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "/home/$USER/QgisStartEN.sh"
		sudo rm -rf "/home/$USER/OnTheLink_QGIS-MENU_EN.sh"
		exit
        ;;
    * ) 
        tput setaf 202; echo "Please enter choice 1, 2 or 3..."
		sleep 1 ; tput reset
esac
done
