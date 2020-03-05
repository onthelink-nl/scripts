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
    --backtitle "QGIS Installation - Created by OnTheLink" \
    --title "Menu" \
    --clear \
    --nocancel \
    --ok-label "Continue" \
    --cancel-label "Cancel" \
    --menu "OnTheLink_QGIS-MENU | EVA-STRETCH | All Options" $HEIGHT $WIDTH 0 \
    "1" "Install/reïnstall/update QGIS" \
    "2" "Remove QGIS and Restore settings (Restore settings for removing crontabs and our sources.list)" \
    "3" "Close this menu and install the auto remove files script" \
    "4" "Close this menu and install the copy script (this will put all qgis projects in your home dir)" \
    "5" "Close this menu normally (When nothing was installed)" \
    "6" "Install the terminal protection software" \
    "7" "Install the auto-updater (for configuration files)" \
    "a" "Install/reïnstall/update QGIS + Exit script (1+4)" \
    "b" "Option a + Install the auto remove files script (1+3)" \
    "c" "Option b + The terminal protection software (FOR SCHOOLS) (REMOVES * in home dir after reboot(/home/"$name"/EVERYTHING)) (1+5+3)" \
    "d" "Reïnstall the auto remove files script + The copy script (3+4)" \
    "e" "Reïnstall the auto remove files script + The copy script + The terminal protection software (3+4+6)" \
    2>&1 1>&3)

case $selection in
    1 )
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		tput setaf 5
		echo "Preparing the QGIS-VERSIONSELECTOR..."
        sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
        sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		cd $STARTDIR
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_EN_STRETCH.sh
		bash OnTheLink_QGIS-MENU_EN_STRETCH.sh
      ;;
    2 )
      sudo rm -rf Removal_EN_STRETCH.sh
		tput setaf 5
		echo "Preparing the QGIS-REMOVAL..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/Removal_EN_STRETCH.sh
		sleep 2
		bash Removal_EN_STRETCH.sh
		cd $STARTDIR
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_EN_STRETCH.sh
		bash OnTheLink_QGIS-MENU_EN_STRETCH.sh
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
		sudo rm -rf OnTheLink_QGIS-MENU_EN_STRETCH.sh
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
		sudo rm -rf OnTheLink_QGIS-MENU_EN_STRETCH.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    5 )
      cd $STARTDIR
		sudo rm -rf OnTheLink_QGIS-MENU_EN_STRETCH.sh
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
		tput setaf 3; echo "Please enter the password you would like to use to protect the terminal..."
		read -s -p "Password: " userpass
        tput reset
        tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/EN/.bashrc > /home/"$name"/.bashrc
		sudo chmod 444 /home/"$name"/.bashrc
		tput setaf 2; echo "The Terminal Protection Software has been installed!"
		sleep 2
		cd $STARTDIR
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_EN_STRETCH.sh
		bash OnTheLink_QGIS-MENU_EN_STRETCH.sh
      ;;
    7 )
      sudo curl -LOs https://github.com/onthelink-nl/scripts/raw/master/EVA/qgis/EVA/Modified/updaterqgis.sh
		sudo cp -f updaterqgis.sh /etc/init.d/updaterqgis.sh
		sudo chmod +x /etc/init.d/updaterqgis.sh
		sudo rm -rf "updaterqgis.sh"
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | { cat; echo "@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh"; } | crontab -
		cd $STARTDIR
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_EN_STRETCH.sh
		bash OnTheLink_QGIS-MENU_EN_STRETCH.sh
      ;;
    a )
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		tput setaf 5
		echo "Preparing combination..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
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
		sudo rm -rf OnTheLink_QGIS-MENU_EN_STRETCH.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    b )
      sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		tput setaf 5
		echo "Preparing combination..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
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
		sudo rm -rf OnTheLink_QGIS-MENU_EN_STRETCH.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    c )
      		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		tput setaf 5
		echo "Preparing combination..."
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		sleep 2
		bash OnTheLink_QGIS-VERSIONSELECTOR_STRETCH_EN.sh
		## downloading original profile
		sudo chmod 777 /etc/profile
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile
		## ask for password and set it in password.sh
		tput setaf 3; echo "Please enter the password you would like to use to protect the terminal..."
		read -s -p "Password: " userpass
      		tput reset
       		tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/EN/.bashrc > /home/"$name"/.bashrc
		sudo chmod 444 /home/"$name"/.bashrc
		tput setaf 2; echo "The Terminal Protection Software has been installed!"
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
		sudo rm -rf OnTheLink_QGIS-MENU_EN_STRETCH.sh
		tput reset
		tput clear
		tput sgr0
		exit
      ;;
    d )
      		tput reset
		tput clear
		tput sgr0
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
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_EN_STRETCH.sh
		bash OnTheLink_QGIS-MENU_EN_STRETCH.sh
      ;;
    e )
      		tput reset
		tput clear
		tput sgr0
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
		tput setaf 3; echo "Please enter the password you would like to use to protect the terminal..."
		read -s -p "Password: " userpass
        	tput reset
        	tput clear
		echo -e "\nexport password=$userpass" | sudo tee -a /etc/profile
		sudo chmod 444 /etc/profile
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/EN/.bashrc > /home/"$name"/.bashrc
		sudo chmod 444 /home/"$name"/.bashrc
		tput setaf 2; echo "The Terminal Protection Software has been installed!"
		sleep 2
		cd $STARTDIR
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_EN_STRETCH.sh
		bash OnTheLink_QGIS-MENU_EN_STRETCH.sh
      ;;
  esac
  
  response=$?
case $response in
   1) 
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-MENU_EN_STRETCH.sh
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput setaf 1
      cd $STARTDIR
      sudo rm -rf OnTheLink_QGIS-MENU_EN_STRETCH.sh
      echo "[ESC] Button has been pressed, Installation will be aborted"
      tput sgr0
      tput reset
      tput clear
      exit 255;;
esac
