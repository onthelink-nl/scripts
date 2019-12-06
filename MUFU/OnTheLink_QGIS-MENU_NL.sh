#!/bin/bash

tput clear
selection=
until [ "$selection" = "5" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-MENU | Versie: 2.8.7 STABIEL
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>"
tput setaf 191; echo -n "ALLEENSTAANDE OPTIES"
tput setaf 45; echo "<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
1 - Installeer/herinstalleer/update QGIS
2 - Verwijder QGIS en zet alles terug naar standaardwaardes
3 - Sluit dit menu en installeer het automatisch verwijderen van bestanden script
4 - Sluit dit menu (KIES DEZE ALLEEN NA DE INSTALLATIE)
5 - Sluit dit menu normaal (KIES DEZE ALLEEN ALS U NIETS HEEFT GEÏNSTALLEERD)
6 - Installeer de terminal beveiligings software
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>"
tput setaf 191; echo -n "GECOMBINEERDE OPTIES"
tput setaf 45; echo "<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
a - Installeer/herinstalleer/update QGIS + Verlaat het script (1+4)
b - Installeer/herinstalleer/update QGIS + Verlaat het script en installeer het automatisch bestanden verwijderen script (1+3)
c - Installeer/herinstalleer/update QGIS + De terminal beveiligings software + Verlaat het script en installeer het automatisch verwijderen van bestanden script (VOOR SCHOLEN) (VERWIJDERD ALLES IN DE THUIS MAP (/home/$USER/EVERYTHING IN HERE)) (1+5+3)
d - Herinstalleer het automatisch verwijderen van bestanden script + Het kopiëren script
e - Herinstalleer het automatisch verwijderen van bestanden script + Het kopiëren script + De terminal beveiligings software
f - Herinstalleer het kopiëren script (Deze zorgt dat je dingen kunt opslaan, zou automatisch geïnstalleerd moeten zijn)
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5; echo "Het QGIS-VERSIE_KEUZEMENU voorbereiden..."
        sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        sleep 2 ; bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        ;;
	2 ) 
		sudo rm -rf Removal_NL.sh
		tput setaf 5; echo "QGIS-VERWIJDERING voorbereiden..."
		sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/Removal_NL.sh
		sleep 2 ; bash Removal_NL.sh
		;;
	3 ) 
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo rm -rf "QgisStart3.6EN.sh"
		sudo rm -rf "QgisStart3.6NL.sh"
		sudo rm -rf "Removal_EN.sh"
		sudo rm -rf "Removal_NL.sh"
		sudo rm -rf "QgisInstaller3.6EN.sh"
		sudo rm -rf "QgisInstaller3.6NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	4 ) 
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo rm -rf "Removal_EN.sh"
		sudo rm -rf "Removal_NL.sh"
		sudo rm -rf "QgisStart3.6EN.sh"
		sudo rm -rf "QgisStart3.6NL.sh"
		sudo rm -rf "QgisInstaller3.6EN.sh"
		sudo rm -rf "QgisInstaller3.6NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		exit
		;;
    5 ) 
        	sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "Removal_EN.sh"
		sudo rm -rf "Removal_NL.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo rm -rf "QgisStart3.6EN.sh"
		sudo rm -rf "QgisStart3.6NL.sh"
		sudo rm -rf "QgisInstaller3.6EN.sh"
		sudo rm -rf "QgisInstaller3.6NL.sh"
		tput reset
		exit
		;;
    6 ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/.bashrc > /home/$USER/.bashrc
		tput setaf 2; echo "De terminal beveiligings software is geïnstalleerd!"
		sleep 2
		tput reset
		;;
	a ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5; echo "Combinatie voorbereiden..."
		sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2 ; bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo rm -rf "QgisStart3.6EN.sh"
		sudo rm -rf "QgisStart3.6NL.sh"
		sudo rm -rf "QgisInstaller3.6EN.sh"
		sudo rm -rf "QgisInstaller3.6NL.sh"
		sudo rm -rf "Removal_EN.sh"
		sudo rm -rf "Removal_NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	b ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5; echo "Combinatie voorbereiden..."
		sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2 ; bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo rm -rf "QgisStart3.6EN.sh"
		sudo rm -rf "Removal_EN.sh"
		sudo rm -rf "Removal_NL.sh"
		sudo rm -rf "QgisStart3.6NL.sh"
		sudo rm -rf "QgisInstaller3.6EN.sh"
		sudo rm -rf "QgisInstaller3.6NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	c ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5; echo "Combinatie voorbereiden..."
		sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2 ; bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/.bashrc > /home/$USER/.bashrc
		tput setaf 2; echo "De terminal beveiligings software is geïnstalleerd!"
		sleep 2
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "Removal_EN.sh"
		sudo rm -rf "Removal_NL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo rm -rf "QgisStart3.6EN.sh"
		sudo rm -rf "QgisStart3.6NL.sh"
		sudo rm -rf "QgisInstaller3.6EN.sh"
		sudo rm -rf "QgisInstaller3.6NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	d ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		;;
	e ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/.bashrc > /home/$USER/.bashrc
		tput setaf 2; echo "De terminal beveiligings software is opnieuw geïnstalleerd!"
		sleep 2
		tput reset
		;;
	f ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		;;
	* ) 
        tput setaf 202; echo "Voer alstublieft alleen de alleenstaande keuzes 1, 2, 3, 4, 5, 6 of de gecombineerde keuzes a,b of c in..."
		sleep 1 ; tput reset
esac
done
