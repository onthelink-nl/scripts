#!/bin/bash

STARTDIR="$(pwd)"
cd /home/$USER/

tput reset
tput clear
selection=
until [ "$selection" = "2" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-REMOVAL
"
tput sgr0 && tput setaf 45; echo "
1 - Remove QGIS + Flatpak (This will break other Flatpak apps!!!)
2 - Remove QGIS
3 - Restore settings
4 - Exit to the QGIS-MENU
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		tput reset
		tput clear
		tput setaf 1
		echo "Removing QGIS + Flatpak..."
		tput setaf 6
		sudo flatpak uninstall --force-remove org.qgis.qgis
		sudo flatpak remote-delete --force org.qgis.qgis-origin
		sudo flatpak remote-delete --force org.qgis.qgis-1-origin
		sudo flatpak remote-delete --force org.qgis.qgis-2-origin
		sudo flatpak remote-delete --force org.qgis.qgis-3-origin
		sudo flatpak remote-delete --force org.qgis.qgis-4-origin
		sudo flatpak remote-delete --force org.qgis.qgis-5-origin
		sudo flatpak remote-delete --force org.qgis.qgis-6-origin
		sudo flatpak remote-delete --force org.qgis.qgis-7-origin
		sudo flatpak remote-delete --force org.qgis.qgis-8-origin
		sudo flatpak remote-delete --force org.qgis.qgis-9-origin
		sudo flatpak remote-delete --force org.qgis.qgis-10-origin
		sudo flatpak remote-delete --force flathub
		sudo flatpak remote-delete --force flathub-1
		sudo flatpak remote-delete --force flathub-2
		sudo flatpak remote-delete --force flathub-3
		sudo flatpak remote-delete --force flathub-4
		sudo flatpak remote-delete --force flathub-5
		sudo flatpak remote-delete --force flathub-6
		sudo flatpak remote-delete --force flathub-7
		sudo flatpak remote-delete --force flathub-8
		sudo flatpak remote-delete --force flathub-9
		sudo flatpak remote-delete --force flathub-10
		sudo flatpak uninstall --force-remove org.kde.Platform
		sudo flatpak uninstall --force-remove org.freedesktop.Platform.html5-codecs
		sudo flatpak uninstall --unused
		sudo rm -rf "/home/$USER/.var/app/org.qgis.qgis"
		sudo rm -rf "/home/$USER/.var/app/org.kde.Platform"
		sudo rm -rf "/home/$USER/.var/app/org.freedesktop.Platform.html5-codecs"
		sudo apt-get --yes --assume-yes remove --purge flatpak
		sudo apt-get --yes --assume-yes clean
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list
		sudo rm -rf /etc/init.d/qgiscopyfiles.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisconfigupdater.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisremovefiles.sh 2> /dev/null | exec 1> /dev/tty
		chattr -i /run/user/1000/doc/by-app/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
		chattr -i /home/"$USER"/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/doc/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/doc" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/flatpak-monitor/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/flatpak-monitor" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/app/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/app" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$USER/org.qgis.qgis/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$USER/org.qgis.qgis" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf "/home/$USER/.var/app/org.qgis.qgis" 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf "/home/$USER/.var/app/org.kde.Platform" 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf "/home/$USER/.var/app/org.freedesktop.Platform.html5-codecs" 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$USER/.var/app/org.qgis.qgis" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$USER/.var/app/org.kde.Platform" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$USER/.var/app/org.freedesktop.Platform.html5-codecs" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/profile.d/flatpak.sh 2> /dev/null | exec 1> /dev/tty
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$USER"/.bashrc
		tput setaf 1; echo "QGIS + FLATPAK REMOVED, restart your chromebook to clean the tmp directory"
		sleep 1
		tput setaf 2; echo "3"
		sleep 1
		tput setaf 2; echo "2"
		sleep 1
		tput setaf 2; echo "1"
		sleep 1
		tput reset
		;;
	2 ) 
		tput reset
		tput clear
		tput setaf 1
		echo "Removing QGIS..."
		tput setaf 6
		sudo flatpak uninstall --force-remove org.qgis.qgis
		sudo flatpak remote-delete --force org.qgis.qgis-origin
		sudo flatpak remote-delete --force org.qgis.qgis-1-origin
		sudo flatpak remote-delete --force org.qgis.qgis-2-origin
		sudo flatpak remote-delete --force org.qgis.qgis-3-origin
		sudo flatpak remote-delete --force org.qgis.qgis-4-origin
		sudo flatpak remote-delete --force org.qgis.qgis-5-origin
		sudo flatpak remote-delete --force org.qgis.qgis-6-origin
		sudo flatpak remote-delete --force org.qgis.qgis-7-origin
		sudo flatpak remote-delete --force org.qgis.qgis-8-origin
		sudo flatpak remote-delete --force org.qgis.qgis-9-origin
		sudo flatpak remote-delete --force org.qgis.qgis-10-origin
		sudo flatpak uninstall --unused
		sudo rm -rf "/home/$USER/.var/app/org.qgis.qgis" 2> /dev/null | exec 1> /dev/tty
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgiscopyfiles.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisconfigupdater.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisremovefiles.sh 2> /dev/null | exec 1> /dev/tty
		chattr -i /run/user/1000/doc/by-app/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
		chattr -i /home/$USER/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$USER/org.qgis.qgis/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$USER/org.qgis.qgis" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf "/home/$USER/org.qgis.qgis" 2> /dev/null | exec 1> /dev/tty
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$USER"/.bashrc
		tput setaf 1; echo "QGIS REMOVED, restart your chromebook to clean the tmp directory"
		sleep 1
		tput setaf 2; echo "3"
		sleep 1
		tput setaf 2; echo "2"
		sleep 1
		tput setaf 2; echo "1"
		sleep 1
		tput reset
		tput clear
		tput sgr0
		;;
	3 ) 
		tput reset
		tput clear
		tput setaf 1
		echo "Restoring settings..."
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		sudo rm -rf /etc/init.d/qgiscopyfiles.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisconfigupdater.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisremovefiles.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list 2> /dev/null | exec 1> /dev/tty
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$USER"/.bashrc
		tput setaf 1; echo "SETTINGS RESTORED!"
		sleep 1
		tput setaf 2; echo "3"
		sleep 1
		tput setaf 2; echo "2"
		sleep 1
		tput setaf 2; echo "1"
		sleep 1
		tput reset
		tput clear
		tput sgr0
		;;
	4 ) 
		cd $STARTDIR
		sudo rm -rf Removal_EN.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
    * ) 
        tput setaf 202
		echo "Please enter choice 1, 2, 3 or 4..."
		sleep 1
		tput reset
		tput clear
		;;
esac
done
