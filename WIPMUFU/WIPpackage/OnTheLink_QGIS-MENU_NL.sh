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
		tput setaf 5; echo "Het QGIS-VERSIE_KEUZEMENU voorbereiden..."
        sleep 2 ; bash qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
        ;;
	2 ) 
		tput setaf 5; echo "QGIS-VERWIJDERING voorbereiden..."
		sleep 2 ; bash qgis/Removal_NL.sh
		;;
	3 ) 
		sudo cp -f qgis/MUFU/Modified/qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo cp -f qgis/MUFU/Modified/qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	4 ) 
		sudo cp -f qgis/MUFU/Modified/qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		exit
		;;
    5 ) 
		tput reset
		exit
		;;
    6 ) 
		sudo cp -f qgis/MUFU/Modified/.bashrc /home/$USER/.bashrc
		tput setaf 2; echo "De terminal beveiligings software is geïnstalleerd!"
		sleep 2
		tput reset
		;;
	a ) 
		tput setaf 5; echo "Combinatie voorbereiden..."
		sleep 2 ; bash qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo cp -f qgis/MUFU/Modified/qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	b ) 
		tput setaf 5; echo "Combinatie voorbereiden..."
		sleep 2 ; bash qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo cp -f qgis/MUFU/Modified/qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo cp -f qgis/MUFU/Modified/qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	c ) 
		tput setaf 5; echo "Combinatie voorbereiden..."
		sleep 2 ; bash qgis/OnTheLink_QGIS-VERSIONSELECTOR_NL.sh
		sudo cp -f qgis/MUFU/Modified/.bashrc /home/$USER/.bashrc
		tput setaf 2; echo "De terminal beveiligings software is geïnstalleerd!"
		sleep 2
		sudo cp -f qgis/MUFU/Modified/qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo cp -f qgis/MUFU/Modified/qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	d ) 
		sudo cp -f qgis/MUFU/Modified/qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo cp -f qgis/MUFU/Modified/qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		;;
	e ) 
		sudo cp -f qgis/MUFU/Modified/qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo cp -f qgis/MUFU/Modified/qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		sudo cp -f qgis/MUFU/Modified/.bashrc /home/$USER/.bashrc
		tput setaf 2; echo "De terminal beveiligings software is opnieuw geïnstalleerd!"
		sleep 2
		tput reset
		;;
	f ) 
		sudo cp -f qgis/MUFU/Modified/qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		;;
	* ) 
        tput setaf 202; echo "Voer alstublieft alleen de alleenstaande keuzes 1, 2, 3, 4, 5, 6 of de gecombineerde keuzes a,b of c in..."
		sleep 1 ; tput reset
esac
done
