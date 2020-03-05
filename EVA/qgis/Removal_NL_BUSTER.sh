#!/bin/bash

export NCURSES_NO_UTF8_ACS=1

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

  phases=( 
    'QGIS VERWIJDEREN (org.qgis.qgis)...'
    'FLATPAK REMOTES VERWIJDEREN...'
    'FLATPAK VERWIJDEREN...'
    'STANDAARDWAARDES TERUGZETTEN...'
)

  phases2=( 
    'QGIS VERWIJDEREN (org.qgis.qgis)...'
    'STANDAARDWAARDES TERUGZETTEN...'
)

phases3=( 
    'STANDAARDWAARDES TERUGZETTEN...'
    'BIJNA KLAAR MET STANDAARDWAARDES TERUGZETTEN...'
)

removeall()
{
  for i in $(seq 1 100); do  
    sleep 0.1

    if [ $i -eq 100 ]; then
        echo -e "XXX\n100\nAfronden...\nXXX"
    elif [ $(($i % 25)) -eq 0 ]; then
        let "phase = $i / 25"
        echo -e "XXX\n$i\n${phases[phase]}\nXXX"
    else
        echo $i
    fi
done | dialog --title 'QGIS + FLATPAK VERWIJDEREN' --gauge "${phases[0]}" 6 60 0
}

removeqgis()
{
  for i in $(seq 1 100); do  
    sleep 0.1

    if [ $i -eq 100 ]; then
        echo -e "XXX\n100\nAfronden...\nXXX"
    elif [ $(($i % 50)) -eq 0 ]; then
        let "phase = $i / 50"
        echo -e "XXX\n$i\n${phases2[phase]}\nXXX"
    else
        echo $i
    fi
done | dialog --title 'QGIS VERWIJDEREN' --gauge "${phases2[0]}" 6 60 0
}

restoresettings()
{
  for i in $(seq 1 100); do  
    sleep 0.1

    if [ $i -eq 100 ]; then
        echo -e "XXX\n100\nAfronden...\nXXX"
    elif [ $(($i % 50)) -eq 0 ]; then
        let "phase = $i / 50"
        echo -e "XXX\n$i\n${phases3[phase]}\nXXX"
    else
        echo $i
    fi
done | dialog --title 'STANDAARDWAARDES TERUGZETTEN' --gauge "${phases3[0]}" 6 60 0
}

tput reset
tput clear


DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
exec 3>&1
selection=$(dialog \
    --backtitle "QGIS Verijderen - Created by OnTheLink" \
    --title "Menu" \
    --clear \
    --nocancel \
    --ok-label "Ga verder" \
    --cancel-label "Annuleren" \
    --menu "OnTheLink_QGIS-VERWIJDEREN | EVA-BUSTER | Alle Opties" $HEIGHT $WIDTH 0 \
    "1" "Verwijder QGIS + Flatpak (Dit zal andere Flatpak apps onfunctioneel maken!!!)" \
    "2" "Verwijder QGIS" \
    "3" "Standaardwaardes terugzetten" \
    "4" "Ga terug naar het QGIS-MENU" \
    2>&1 1>&3)

case $selection in
    1 )
      ## Start the Spinner:
		removeall &
		## Make a note of its Process ID (PID):
		PROGRESS_PID=$!
		sudo flatpak uninstall --force-remove org.qgis.qgis > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-1-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-2-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-3-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-4-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-5-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-6-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-7-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-8-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-9-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-10-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-1 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-2 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-3 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-4 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-5 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-6 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-7 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-8 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-9 > /dev/null 2>&1
		sudo flatpak remote-delete --force flathub-10> /dev/null 2>&1
		sudo flatpak uninstall --force-remove org.kde.Platform > /dev/null 2>&1
		sudo flatpak uninstall --force-remove org.freedesktop.Platform.html5-codecs > /dev/null 2>&1
		sudo flatpak uninstall --unused > /dev/null 2>&1
		sudo rm -rf "/home/$name/.var/app/org.qgis.qgis" > /dev/null 2>&1
		sudo rm -rf "/home/$name/.var/app/org.kde.Platform" > /dev/null 2>&1
		sudo rm -rf "/home/$name/.var/app/org.freedesktop.Platform.html5-codecs" > /dev/null 2>&1
		sudo apt-get --yes --assume-yes remove --purge flatpak 2> /dev/null | exec 1> /dev/tty > /dev/null 2>&1
		sudo apt-get --yes --assume-yes clean 2> /dev/null | exec 1> /dev/tty > /dev/null 2>&1
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab - 
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab - 
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab - 
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list 2> /dev/null | exec 1> /dev/tty 
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list 2> /dev/null | exec 1> /dev/tty 
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
		sudo chmod 777 /etc/profile > /dev/null 2>&1
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile 
		sudo mv profile /etc/profile > /dev/null 2>&1
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc > /dev/null 2>&1
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$name"/.bashrc
		kill -9 $PROGRESS_PID
		sleep 10
		dialog --msgbox "QGIS en Flatpak zijn verwijderd!" 5 39 
		sudo rm -rf Removal_NL_BUSTER.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		exit
		;;
    2 )
      ## Start the Spinner:
		removeqgis &
		## Make a note of its Process ID (PID):
		PROGRESS_PID=$!
		sudo flatpak uninstall --force-remove org.qgis.qgis > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-1-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-2-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-3-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-4-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-5-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-6-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-7-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-8-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-9-origin > /dev/null 2>&1
		sudo flatpak remote-delete --force org.qgis.qgis-10-origin > /dev/null 2>&1
		sudo flatpak uninstall --unused > /dev/null 2>&1
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
		sudo chmod 777 /etc/profile > /dev/null 2>&1
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile > /dev/null 2>&1
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc > /dev/null 2>&1
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$name"/.bashrc
		kill -9 $PROGRESS_PID
		sleep 10
		dialog --msgbox "QGIS is verwijderd!" 5 39 
		sudo rm -rf Removal_NL_BUSTER.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		exit
		;;
    3 )
      ## Start the Spinner:
		restoresettings &
		## Make a note of its Process ID (PID):
		PROGRESS_PID=$!
		crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
		crontab -l | grep -v '@reboot sleep 60 && /bin/bash /etc/init.d/updaterqgis.sh' | crontab -
		crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
		sudo rm -rf /etc/init.d/qgiscopyfiles.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisconfigupdater.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/init.d/qgisremovefiles.sh 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list 2> /dev/null | exec 1> /dev/tty
		sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list 2> /dev/null | exec 1> /dev/tty
		## downloading original profile
		sudo chmod 777 /etc/profile > /dev/null 2>&1
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/profile
		sudo mv profile /etc/profile > /dev/null 2>&1
		## download modified .bashrc file
		sudo chmod 777 /home/"$name"/.bashrc > /dev/null 2>&1
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/.bashrc > /home/"$name"/.bashrc
		kill -9 $PROGRESS_PID
		sleep 10
		dialog --msgbox "Instellingen zijn hersteld!" 5 39 
		sudo rm -rf Removal_NL_BUSTER.sh 2> /dev/null | exec 1> /dev/tty
		tput reset
		tput clear
		exit
		;;
    4 )
                tput reset
		tput clear
		tput sgr0
		cd $STARTDIR
		sudo rm -rf Removal_NL_BUSTER.sh 2> /dev/null | exec 1> /dev/tty
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/OnTheLink_QGIS-MENU_NL_BUSTER.sh
		bash OnTheLink_QGIS-MENU_NL_BUSTER.sh
		exit
		;;
  esac
  
response=$?
case $response in
   1) 
      cd $STARTDIR
      sudo rm -rf Removal_NL_BUSTER.sh
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput setaf 1
      cd $STARTDIR
      sudo rm -rf Removal_NL_BUSTER.sh
      echo "[ESC] Knop is ingedrukt, Installatie wordt afgebroken"
      tput sgr0
      tput reset
      tput clear
      exit 255;;
esac
