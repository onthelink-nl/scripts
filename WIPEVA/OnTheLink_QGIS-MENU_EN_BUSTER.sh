#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

tput clear
selection=
until [ "$selection" = "4" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-MENU | Version: 3.4 INSTABLE | BUSTER
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>"
tput setaf 191; echo -n "STANDALONE OPTIONS"
tput setaf 45; echo "<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
1 - Install/reïnstall/update QGIS
2 - Remove QGIS and Restore settings (Restore settings for removing crontabs and our sources.list)
3 - Close this menu and install the auto remove files script
4 - Close this menu normally
5 - Install the terminal protection software
6 - Install the auto-updater (for configuration files)
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>"
tput setaf 191; echo -n "COMBINED OPTIONS"
tput setaf 45; echo "<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
a - Install/reïnstall/update QGIS + Exit script (1+4)
b - Install/reïnstall/update QGIS + Exit script and install the auto remove files script (1+3)
c - Install/reïnstall/update QGIS + The terminal protection software + Exit script and install the auto remove files script (FOR SCHOOLS) (REMOVES EVERYTHING IN THE HOME DIR (/home/"$name"/EVERYTHING)) (1+5+3)
d - Reïnstall the auto remove files script + The terminal protection software (3+5)
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		tput setaf 5
		echo "Preparing the QGIS-VERSIONSELECTOR..."
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
        sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
        ;;
	2 ) 
		sudo rm -rf Removal_EN.sh
		tput setaf 5
		echo "Preparing QGIS-REMOVAL..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/Removal_EN.sh
		sleep 2
		bash Removal_EN.sh
		;;
	3 ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_EN_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	4 ) 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_EN_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
    5 ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/.bashrc > /home/"$name"/.bashrc
		tput setaf 2; echo "The terminal protection software has been installed!"
		sleep 2
		tput reset
		tput clear
		tput sgr0
		;;
	6 ) 
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/WIPEVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		;;
	a ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		tput setaf 5
		echo "Preparing combination..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/WIPEVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_EN_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	b ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		tput setaf 5
		echo "Preparing combination..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/WIPEVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_EN_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	c ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		tput setaf 5
		echo "Preparing combination..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/.bashrc > /home/"$name"/.bashrc
		tput setaf 2
		echo "The terminal protection software has been installed!"
		sleep 2
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/WIPEVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_EN_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	d ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/.bashrc > /home/"$name"/.bashrc
		tput setaf 2
		echo "The terminal protection software has been (re)installed!"
		sleep 2
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		tput clear
		tput sgr0
		;;
	* ) 
        tput setaf 202
		echo "Please only enter standalone options 1, 2, 3, 4, 5 or combined options a, b, c or d..."
		sleep 1
		tput reset
		;;
esac
done
