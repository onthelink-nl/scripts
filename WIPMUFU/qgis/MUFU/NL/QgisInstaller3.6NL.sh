#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   tput setaf 1
   echo "Dit script moet uitgevoerd worden met root toegang (met sudo werkt het best)"
   sleep 3
   tput reset
   tput clear
   tput sgr0
   exit 1
fi

spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in $(seq 0 7)
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 1
    done
  done
}

echo "Bezig de installatie te starten..."
sleep 2
echo "Daar gaan we!!!"
sleep 1

## Start the Spinner:
spin &
## Make a note of its Process ID (PID):
SPIN_PID=$!

##Terminal leegmaken voordat het script uitvoert
tput reset
tput clear

##Verwijderen van oudere versie van het script
tput bold && tput setaf 5; echo "Oudere versies verwijderen..."
tput setaf 6
sudo flatpak uninstall --force-remove org.qgis.qgis 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-1-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-2-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-3-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-4-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-5-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-6-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-7-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-8-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-9-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force org.qgis.qgis-10-origin 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-1 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-2 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-3 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-4 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-5 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-6 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-7 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-8 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-9 2> /dev/null | exec 1> /dev/tty
sudo flatpak remote-delete --force flathub-10 2> /dev/null | exec 1> /dev/tty
sudo flatpak uninstall --force-remove org.kde.Platform 2> /dev/null | exec 1> /dev/tty
sudo flatpak uninstall --force-remove org.freedesktop.Platform.html5-codecs 2> /dev/null | exec 1> /dev/tty
sudo flatpak uninstall --unused 2> /dev/null | exec 1> /dev/tty
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

##stop spinner
kill -9 $SPIN_PID

#Reset_TERM
tput reset
tput clear

MACHINE_VERSION=`cat /etc/debian_version`
case $MACHINE_VERSION in
9|9.1|9.2|9.3|9.4|9.5|9.6|9.7|9.8|9.9)
   # Stretch stuff here

##STRETCH CHECK VOLTOOID
tput setaf 2
echo "STRETCH GEVONDEN!"
sleep 2
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list

##Script daadwerkelijke starten
tput reset
tput clear

##Informatie over de makers van het script en over het script zelf
tput setaf 2; echo Dit script is gemaakt door Misha Opstal en Leopold Siccama Hiemstra.
echo "Het script zal QGIS 3.6 (STRETCH) installeren op uw chromebook."
echo Flatpak wordt gebruikt voor het belangrijkste deel van de installatie!
tput bold; echo Wij zijn niet de makers van QGIS of flatpak en dit is een onofficieel script.
tput setaf 5; echo -n "Onze website: "
echo -e '\e]8;;https://onthelink.nl\aOnTheLink\e]8;;\a'
echo -n "De Flatpak website: "
echo -e '\e]8;;https://flatpak.org\aFlatpak\e]8;;\a'
echo -n "De QGIS website: "
echo -e '\e]8;;https://qgis.org\aQGIS\e]8;;\a'
tput setaf 69; echo Alvast bedankt voor het gebruiken van ons script!
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>INSTALLATIE IS GESTART<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WAARSCHUWING: Het wordt aangeraden om altijd een stabiele internetverbinding te hebben en niet op ctrl+c te drukken (Wanneer u dit doet zult u de chromebook moeten resetten met een herstel-usb of via powerwash)"
tput sgr0
tput setaf 3

##Wachten op reactie van de gebruiker
read -n 1 -s -r -p "Druk op een willekeurige toets om verder te gaan..."

##sending positive reaction
echo ";)"
tput reset
tput clear

## Start the Spinner:
spin &

## Make a note of its Process ID (PID):
SPIN_PID=$!

##Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0
sudo apt-get --yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 5
echo "Installatie van QGIS gestart:"
tput setaf 9
echo "Tijdelijke map aanmaken"
sudo rm -rf /home/"$USER"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
mkdir /home/"$USER"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
cd /home/"$USER"/qgisbestanden
tput sgr0
tput setaf 2
echo "De tijdelijke map is aangemaakt!"
tput sgr0
tput setaf 9
echo "Benodigdheden installeren..."
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/OTL_QGIS_STRETCH.list
sudo cp -f OTL_QGIS_STRETCH.list /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list
sudo chmod +x /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list
sudo rm -rf "OTL_QGIS_STRETCH.list"
sudo apt-get --yes --assume-yes install wget apt-utils nautilus inotify-tools cron 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Benodigdheden geïnstalleerd!"
tput sgr0
tput setaf 9
echo "Flatpak installeren..."
tput sgr0
sudo apt-get -t stretch-backports --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Flatpak is geïnstalleerd!"
tput setaf 9
echo "apt vernieuwen..."
tput sgr0
sudo apt-get --yes --assume-yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "apt vernieuwd!"
tput sgr0
tput setaf 9
echo "QGIS installeren..."
tput sgr0
sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty
sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/qgis.flatpakref 2> /dev/null | exec 1> /dev/tty
kill -9 $SPIN_PID
flatpak -y install qgis.flatpakref
tput reset
tput clear
flatpak update --commit=f3e180bb9ddc0cc9fc304e899b7c71405d10db81a8200f3d34dfb6288fec15b9 org.qgis.qgis
tput bold
tput setaf 5
echo "QGIS 3.6 is geïnstalleerd!!!"
sleep 1
tput sgr0
tput setaf 1
echo "Beeindigen van script in 10 seconden..."
sleep 5
tput setaf 1
echo "5"
sleep 1
tput setaf 1
echo "4"
sleep 1
tput setaf 1
echo "3"
sleep 1
tput setaf 1
echo "2"
sleep 1
tput setaf 1
echo "1"
sleep 1
tput setaf 2
echo "Vaarwel!"
sleep 1
cd $STARTDIR
sudo rm -rf /home/"$USER"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
tput reset
tput clear
tput sgr0
exit
;;
10|10.1|10.2|10.3|10.4|10.5|10.6|10.7|10.8|10.9)
   ## Buster stuff here

##BUSTER CHECK VOLTOOID
tput setaf 2
echo "BUSTER GEVONDEN!"
sleep 2
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list

##Script daadwerkelijke starten
tput reset
tput clear

##Informatie over de makers van het script en over het script zelf
tput setaf 2; echo Dit script is gemaakt door Misha Opstal en Leopold Siccama Hiemstra.
echo "Het script zal QGIS 3.6 (BUSTER) installeren op uw chromebook."
echo Flatpak wordt gebruikt voor het belangrijkste deel van de installatie!
tput bold; echo Wij zijn niet de makers van QGIS of flatpak en dit is een onofficieel script.
tput setaf 5; echo -n "Onze website: "
echo -e '\e]8;;https://onthelink.nl\aOnTheLink\e]8;;\a'
echo -n "De Flatpak website: "
echo -e '\e]8;;https://flatpak.org\aFlatpak\e]8;;\a'
echo -n "De QGIS website: "
echo -e '\e]8;;https://qgis.org\aQGIS\e]8;;\a'
tput setaf 69; echo Alvast bedankt voor het gebruiken van ons script!
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>INSTALLATIE IS GESTART<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WAARSCHUWING: Het wordt aangeraden om altijd een stabiele internetverbinding te hebben en niet op ctrl+c te drukken (Wanneer u dit doet zult u de chromebook moeten resetten met een herstel-usb of via powerwash)"
tput sgr0
tput setaf 3

##Wachten op reactie van de gebruiker
read -n 1 -s -r -p "Druk op een willekeurige toets om verder te gaan..."

##sending positive reaction
echo ";)"

## Start the Spinner:
spin &

## Make a note of its Process ID (PID):
SPIN_PID=$!

##Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0
sudo apt-get --yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 5
echo "Installatie van QGIS gestart:"
tput setaf 9
echo "Tijdelijke map aanmaken"
sudo rm -rf /home/"$USER"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
mkdir /home/"$USER"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
cd /home/"$USER"/qgisbestanden
tput sgr0
tput setaf 2
echo "De tijdelijke map is aangemaakt!"
tput sgr0
tput setaf 9
echo "Benodigdheden installeren..."
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/MUFU/Modified/OTL_QGIS_BUSTER.list
sudo cp -f OTL_QGIS_BUSTER.list /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo chmod +x /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo rm -rf "OTL_QGIS_BUSTER.list"
sudo apt-get --yes --assume-yes install wget apt-utils nautilus rsync grsync inotify-tools cron 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Benodigdheden geïnstalleerd!"
tput sgr0
tput setaf 9
echo "Flatpak installeren..."
tput sgr0
sudo apt-get -t buster-backports --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Flatpak is geïnstalleerd!"
tput setaf 9
echo "apt vernieuwen..."
tput sgr0
sudo apt-get --yes --assume-yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "apt vernieuwd!"
tput sgr0
tput setaf 9
echo "QGIS installeren..."
tput sgr0
sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty
sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPMUFU/qgis/qgis.flatpakref 2> /dev/null | exec 1> /dev/tty
kill -9 $SPIN_PID
flatpak -y install qgis.flatpakref
tput reset
tput clear
flatpak update --commit=f3e180bb9ddc0cc9fc304e899b7c71405d10db81a8200f3d34dfb6288fec15b9 org.qgis.qgis
tput bold
tput setaf 5
echo "QGIS 3.6 is geïnstalleerd!!!"
sleep 1
tput sgr0
tput setaf 1
echo "Beeindigen van script in 10 seconden..."
sleep 5
tput setaf 1
echo "5"
sleep 1
tput setaf 1
echo "4"
sleep 1
tput setaf 1
echo "3"
sleep 1
tput setaf 1
echo "2"
sleep 1
tput setaf 1
echo "1"
sleep 1
tput setaf 2
echo "Vaarwel!"
sleep 1
cd $STARTDIR
sudo rm -rf /home/"$USER"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
tput reset
tput clear
tput sgr0
exit
;;
*)
## FAILSAFE
  tput setaf 3
  echo "Stretch en Buster niet gevonden, uw debian versie wordt nog niet ondersteunt..."
  sleep 1
  tput setaf 1
  echo "4"
  sleep 1
  tput setaf 1
  echo "3"
  sleep 1
  tput setaf 1
  echo "2"
  sleep 1
  tput setaf 1
  echo "1"
  cd $STARTDIR
  sudo rm -rf /home/"$USER"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
  tput reset
  tput clear
  tput sgr0
  exit
;;
esac
