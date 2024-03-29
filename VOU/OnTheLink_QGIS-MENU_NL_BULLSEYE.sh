#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

export NCURSES_NO_UTF8_ACS=1
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
exec 3>&1
selection=$(dialog \
    --backtitle "QGIS Installatie - Gemaakt door OnTheLink" \
    --title "Menu" \
    --clear \
    --nocancel \
    --ok-label "Ga verder" \
    --cancel-label "Annuleren" \
    --menu "OnTheLink_QGIS-MENU | VOU-BULLSEYE | Alle Opties" $HEIGHT $WIDTH 0 \
    "1" "Installeer/herinstalleer/update QGIS" \
    "2" "Verwijder QGIS en zet alles terug naar Standaardwaardes (Standaardwaardes om crontabs te verwijderen en ook onze sources.list)" \
    "3" "Sluit dit menu en installeer het automatisch verwijderen van bestanden script" \
    "4" "Sluit dit menu en installeer het kopiëren script (zorgt ervoor dat de bestanden van qgis in de hoofdmap worden gezet)" \
    "5" "Sluit dit menu normaal" \
    "6" "Installeer de terminal beveiligings software" \
    "7" "Installeer de auto-updater (voor configuratie bestanden)" \
    "a" "Installeer/herinstalleer/update QGIS + Verlaat het script (1+4)" \
    "b" "Optie a + verwijder script + kopie script(1+3+4)" \
    "c" "Optie b + terminal beveiligingssoftware (VOOR SCHOLEN) (VERWIJDERD ALLES IN DE THUIS MAP (/home/"$name"/ALLES)) (1+5+3)" \
    "d" "Herinstalleer het automatisch verwijderen van bestanden script + Het kopiëren script (3+4)" \
    "e" "Herinstalleer het automatisch verwijderen van bestanden script + Het kopiëren script + De terminal beveiligings software (3+4+6)" \
    2>&1 1>&3)

case $selection in
    1 )
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		tput setaf 5
		echo "Het QGIS-VERSIE_KEUZEMENU voorbereiden..."
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
        sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		cd $STARTDIR
      ;;
    2 )
      sudo rm -rf Removal_NL_BULLSEYE.sh
		tput setaf 5
		echo "QGIS-VERWIJDERING voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/Removal_NL_BULLSEYE.sh
		sleep 2
		bash Removal_NL_BULLSEYE.sh
		cd $STARTDIR
      ;;
    3 )
      sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgisremovefiles.sh
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
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    4 )
      sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    5 )
      cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    6 )
      ## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/profile
		sudo mv profile /etc/profile
		## ask for password and set it in password.sh
		tput setaf 3; echo "Voer hier alstublieft uw gewenste wachtwoord in om de terminal te beveiligen..."
		read -s -p "Wachtwoord: " userpass
        tput reset
        tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/VOU/qgis/VOU/Modified/protectionsoftware.sh
		sudo cp -f protectionsoftware.sh /etc/init.d/protectionsoftware.sh
		sudo chmod +x /etc/init.d/protectionsoftware.sh
		sudo rm -rf "protectionsoftware.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/protectionsoftware.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/protectionsoftware.sh"; } | crontab -
		tput setaf 2; echo "De terminal beveiligingssoftware is geïnstalleerd!"
		sleep 2
		cd $STARTDIR
      ;;
    7 )
      sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/VOU/qgis/VOU/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		cd $STARTDIR
      ;;
    a )
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		tput setaf 5
		echo "Combinatie voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/VOU/qgis/VOU/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab - 
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    b )
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		tput setaf 5
		echo "Combinatie voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/VOU/qgis/VOU/Modified/updaterqgis.sh
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
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    c )
      		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		tput setaf 5
		echo "Combinatie voorbereiden..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_BULLSEYE_NL.sh
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/profile
		sudo mv profile /etc/profile
		## ask for password and set it in password.sh
		tput setaf 3; echo "Voer hier alstublieft uw gewenste wachtwoord in om de terminal te beveiligen..."
		read -s -p "Wachtwoord: " userpass
      		tput reset
       		tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		tput setaf 2; echo "De terminal beveiligingssoftware is geïnstalleerd!"
		sleep 2
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgisremovefiles.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/VOU/qgis/VOU/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/VOU/qgis/VOU/Modified/protectionsoftware.sh
		sudo cp -f protectionsoftware.sh /etc/init.d/protectionsoftware.sh
		sudo chmod +x /etc/init.d/protectionsoftware.sh
		sudo rm -rf "protectionsoftware.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/protectionsoftware.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab -  
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/protectionsoftware.sh"; } | crontab -
		cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    d )
      		tput reset
		tput clear
		tput sgr0
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgisremovefiles.sh
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
      ;;
    e )
      		tput reset
		tput clear
		tput sgr0
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgisremovefiles.sh
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
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/profile
		sudo mv profile /etc/profile
		## ask for password and set it in password.sh
		tput setaf 3; echo "Voer hier alstublieft uw gewenste wachtwoord in om de terminal te beveiligen..."
		read -s -p "Wachtwoord: " userpass
        	tput reset
        	tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/VOU/qgis/VOU/Modified/protectionsoftware.sh
		sudo cp -f protectionsoftware.sh /etc/init.d/protectionsoftware.sh
		sudo chmod +x /etc/init.d/protectionsoftware.sh
		sudo rm -rf "protectionsoftware.sh"
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/protectionsoftware.sh' | crontab -
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/protectionsoftware.sh"; } | crontab -
		tput setaf 2; echo "De terminal beveiligingssoftware is geïnstalleerd!"
		sleep 2
		cd $STARTDIR
      ;;
  esac
  
  response=$?
case $response in
   1) 
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput setaf 1
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-MENU_NL_BULLSEYE.sh
      echo "[ESC] Knop is ingedrukt, Installatie wordt afgebroken"
      tput sgr0
      tput reset
      tput clear
      exit 255;;
esac
