#!/bin/bash

tput reset
selection=
until [ "$selection" = "2" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-VERWIJDERING
"
tput sgr0 && tput setaf 45; echo "
1 - Verwijder QGIS + Flatpak (Dit zal andere Flatpak apps onfunctioneel maken (niet langer te gebruiken...))
2 - Verwijder QGIS
3 - Ga terug naar het QGIS-MENU
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		tput reset
		tput setaf 1; echo "QGIS + Flatpak Verwijderen..."
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
		sudo rm -rf /home/$USER/.var/app/org.qgis.qgis
		sudo rm -rf /home/$USER/.var/app/org.kde.Platform
		sudo rm -rf /home/$USER/.var/app/org.freedesktop.Platform.html5-codecs
		sudo apt-get --yes --assume-yes remove --purge flatpak
		sudo apt-get --yes --assume-yes clean
		sudo apt-get --yes --assume-yes autoremove --purge
		sudo apt-get --yes --assume-yes clean
		crontab -r
		sudo rm -rf /etc/apt/sources.list.d/OTL.list
		sudo rm -rf /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf /etc/init.d/qgisremovefiles.sh
		chattr -i /run/user/1000/doc/by-app/org.qgis.qgis/
		chattr -i /home/$USER/org.qgis.qgis/
		sudo mv "/run/user/1000/doc/*" /tmp
		sudo mv "/run/user/1000/doc" /tmp
		sudo mv "/run/user/1000/flatpak-monitor/*" /tmp
		sudo mv "/run/user/1000/flatpak-monitor" /tmp
		sudo mv "/run/user/1000/app/*" /tmp
		sudo mv "/run/user/1000/app" /tmp
		sudo mv "/home/$USER/org.qgis.qgis/*" /tmp
		sudo mv "/home/$USER/org.qgis.qgis" /tmp
		tput setaf 1; echo "QGIS + FLATPAK VERWIJDERD"
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
		tput setaf 1; echo "QGIS Verwijderen..."
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
		sudo rm -rf /home/$USER/.var/app/org.qgis.qgis
		sudo apt-get --yes --assume-yes clean
		sudo apt-get --yes --assume-yes autoremove --purge
		sudo apt-get --yes --assume-yes clean
		crontab -r
		sudo rm -rf /etc/apt/sources.list.d/OTL.list
		sudo rm -rf /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf /etc/init.d/qgisremovefiles.sh
		chattr -i /run/user/1000/doc/by-app/org.qgis.qgis/
		chattr -i /home/$USER/org.qgis.qgis/
		sudo mv "/home/$USER/org.qgis.qgis/*" /tmp
		sudo mv "/home/$USER/org.qgis.qgis" /tmp
    tput setaf 1; echo "QGIS VERWIJDERD"
    sleep 1
    tput setaf 2; echo "3"
    sleep 1
    tput setaf 2; echo "2"
    sleep 1
    tput setaf 2; echo "1"
    sleep 1
		tput reset
		;;
	3 ) 
		tput reset
		exit
		;;
    * ) 
        tput setaf 202; echo "Voer alstublieft alleen keuze 1, 2 of 3 in..."
		sleep 1 ; tput reset
esac
done
