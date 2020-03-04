#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

phases=( 
    'REMOVING QGIS (org.qgis.qgis)...'
    'REMOVING FLATPAK REMOTES...'
    'REMOVING UNUSED FLATPAK APPS...'
    'RESTORING DEFAULT SETTINGS...'
)

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
		for i in $(seq 1 100); do  
    sleep 0.1

    if [ $i -eq 100 ]; then
        echo -e "XXX\n100\nDone!\nXXX"
    elif [ $(($i % 25)) -eq 0 ]; then
        let "phase = $i / 25"
        echo -e "XXX\n$i\n${phases[phase]}\nXXX"
    else
        echo $i
    fi 
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
		sudo rm -rf "/home/$name/.var/app/org.qgis.qgis"
		sudo rm -rf "/home/$name/.var/app/org.kde.Platform"
		sudo rm -rf "/home/$name/.var/app/org.freedesktop.Platform.html5-codecs"
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
		chattr -i /home/"$name"/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/doc/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/doc" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/flatpak-monitor/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/flatpak-monitor" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/app/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/run/user/1000/app" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$name/org.qgis.qgis/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$name/org.qgis.qgis" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf "/home/$name/.var/app/org.qgis.qgis" 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf "/home/$name/.var/app/org.kde.Platform" 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf "/home/$name/.var/app/org.freedesktop.Platform.html5-codecs" 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$name/.var/app/org.qgis.qgis" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$name/.var/app/org.kde.Platform" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$name/.var/app/org.freedesktop.Platform.html5-codecs" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/profile.d/flatpak.sh 2> /dev/null | exec 1> /dev/tty
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$name"/.bashrc
done | dialog --title 'REMOVING QGIS + FLATPAK' --gauge "${phases[0]}" 6 60 0
		tput reset
		tput clear
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
		sudo rm -rf "/home/$name/.var/app/org.qgis.qgis" 2> /dev/null | exec 1> /dev/tty
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgiscopyfiles.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisconfigupdater.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisremovefiles.sh 2> /dev/null | exec 1> /dev/tty
		chattr -i /run/user/1000/doc/by-app/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
		chattr -i /home/$name/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$name/org.qgis.qgis/*" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo mv "/home/$name/org.qgis.qgis" /tmp 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf "/home/$name/org.qgis.qgis" 2> /dev/null | exec 1> /dev/tty
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$name"/.bashrc
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
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$name"/.bashrc
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
