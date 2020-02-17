#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

tput clear
selection=
until [ "$selection" = "4" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-MENU | Versie: 3.4 INSTABIEL | BUSTER
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
4 - Sluit dit menu en installeer het kopiëren script (zorgt ervoor dat de bestanden van qgis in de hoofdmap worden gezet)
5 - Sluit dit menu normaal
6 - Installeer de terminal beveiligings software
7 - Installeer de auto-updater (voor configuratie bestanden)
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
d - Herinstalleer het automatisch verwijderen van bestanden script + Het kopiëren script (3+4)
e - Herinstalleer het automatisch verwijderen van bestanden script + Het kopiëren script + De terminal beveiligings software (3+4+6)
"
    tput setaf 6; echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5
		echo "Het QGIS-VERSIE_KEUZEMENU voorbereiden..."
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        ;;
	2 ) 
		sudo rm -rf Removal_NL.sh
		tput setaf 5
		echo "QGIS-VERWIJDERING voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/Removal_NL.sh
		sleep 2
		bash Removal_NL.sh
		;;
	3 ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_STRETCH.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	4 ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_STRETCH.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	5 ) 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
    6 ) 
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## ask for password and set it in password.sh
		tput setaf 3; echo "Voer hier alstublieft uw gewenste wachtwoord in om de terminal te beveiligen..."
		read -s -p "Wachtwoord: " userpass
        tput reset
        tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/NL/.bashrc > /home/"$name"/.bashrc
		sudo chmod 444 /home/"$name"/.bashrc
		tput setaf 2; echo "De terminal beveiligingssoftware is geïnstalleerd!"
		sleep 2
		tput reset
		tput clear
		tput sgr0
		;;
	7 ) 
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/EVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		tput reset
		tput clear
		tput sgr0
		;;
	a ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		tput setaf 5
		echo "Combinatie voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/EVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab - 
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
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/EVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab -  
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
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## ask for password and set it in password.sh
		tput setaf 3; echo "Voer hier alstublieft uw gewenste wachtwoord in om de terminal te beveiligen..."
		read -s -p "Wachtwoord: " userpass
        tput reset
        tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/NL/.bashrc > /home/"$name"/.bashrc
		sudo chmod 444 /home/"$name"/.bashrc
		tput setaf 2; echo "De terminal beveiligingssoftware is geïnstalleerd!"
		sleep 2
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/EVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab -  
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BUSTER.sh
		tput reset
		tput clear
		tput sgr0
		exit
		;;
	d ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		tput clear
		tput sgr0
		;;
	e ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## ask for password and set it in password.sh
		tput setaf 3; echo "Voer hier alstublieft uw gewenste wachtwoord in om de terminal te beveiligen..."
		read -s -p "Wachtwoord: " userpass
        tput reset
        tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/NL/.bashrc > /home/"$name"/.bashrc
		sudo chmod 444 /home/"$name"/.bashrc
		tput setaf 2; echo "De terminal beveiligingssoftware is geïnstalleerd!"
		sleep 2
		tput reset
		tput clear
		tput sgr0
		;;
	* ) 
        tput setaf 202
		echo "Voer alstublieft alleen de alleenstaande keuzes 1, 2, 3, 4, 5, 6, 7 of de gecombineerde keuzes a, b, c, d of e in..."
		sleep 1
		tput reset
		;;
esac
done
