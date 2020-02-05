#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

tput clear
selection=
until [ "$selection" = "4" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-MENU | Versie: 3.1 INSTABIEL | BUSTER
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
2 - Verwijder QGIS en zet alles terug naar Standaardwaardes (Standaardwaardes om crontabs te verwijderen en ook onze sources.list)
3 - Sluit dit menu en installeer het automatisch verwijderen van bestanden script
4 - Sluit dit menu normaal
5 - Installeer de terminal beveiligings software
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
c - Installeer/herinstalleer/update QGIS + De terminal beveiligings software + Verlaat het script en installeer het automatisch verwijderen van bestanden script (VOOR SCHOLEN) (VERWIJDERD ALLES IN DE THUIS MAP (/home/"$name"/ALLES)) (1+5+3)
d - Herinstalleer het automatisch verwijderen van bestanden script + De terminal beveiligings software
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5
		echo "Het QGIS-VERSIE_KEUZEMENU voorbereiden..."
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        ;;
	2 ) 
		sudo rm -rf Removal_NL.sh
		tput setaf 5
		echo "QGIS-VERWIJDERING voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/Removal_NL.sh
		sleep 2
		bash Removal_NL.sh
		;;
	3 ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	4 ) 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
    5 ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/.bashrc > /home/"$name"/.bashrc
		tput setaf 2; echo "De terminal beveiligings software is geïnstalleerd!"
		sleep 2
		tput reset
		tput clear
		tput sgr0
		;;
	a ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5
		echo "Combinatie voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	b ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5
		echo "Combinatie voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	c ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5
		echo "Combinatie voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/.bashrc > /home/"$name"/.bashrc
		tput setaf 2
		echo "De terminal beveiligings software is geïnstalleerd!"
		sleep 2
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	d ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/.bashrc > /home/"$name"/.bashrc
		tput setaf 2
		echo "De terminal beveiligings software is geherinstalleerd!"
		sleep 2
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/qgisremovefiles.sh
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
		echo "Voer alstublieft alleen de alleenstaande keuzes 1, 2, 3, 4, 5 of de gecombineerde keuzes a, b, c of d in..."
		sleep 1
		tput reset
		;;
esac
done
