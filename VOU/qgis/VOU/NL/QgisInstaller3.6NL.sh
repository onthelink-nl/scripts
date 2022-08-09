#!/bin/bash
if [[ $EUID -ne 1000 ]]; then
   tput setaf 1
   echo "Dit script kan niet met root toegang worden uitgevoerd"
   sleep 3
   tput reset
   tput clear
   tput sgr0
   exit 1
fi

#Get current user
name="$(logname)"

#Get current path (Required for completion removal of install files)
STARTDIR="$(pwd)"

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
flatpak uninstall --force-remove org.qgis.qgis
flatpak remote-delete --force org.qgis.qgis-origin
flatpak remote-delete --force org.qgis.qgis-1-origin
flatpak remote-delete --force org.qgis.qgis-2-origin
flatpak remote-delete --force org.qgis.qgis-3-origin
flatpak remote-delete --force org.qgis.qgis-4-origin
flatpak remote-delete --force org.qgis.qgis-5-origin
flatpak remote-delete --force org.qgis.qgis-6-origin
flatpak remote-delete --force org.qgis.qgis-7-origin
flatpak remote-delete --force org.qgis.qgis-8-origin
flatpak remote-delete --force org.qgis.qgis-9-origin
flatpak remote-delete --force org.qgis.qgis-10-origin
flatpak remote-delete --force flathub
flatpak remote-delete --force flathub-1
flatpak remote-delete --force flathub-2
flatpak remote-delete --force flathub-3
flatpak remote-delete --force flathub-4
flatpak remote-delete --force flathub-5
flatpak remote-delete --force flathub-6
flatpak remote-delete --force flathub-7
flatpak remote-delete --force flathub-8
flatpak remote-delete --force flathub-9
flatpak remote-delete --force flathub-10
flatpak uninstall --force-remove org.kde.Platform
flatpak uninstall --force-remove org.freedesktop.Platform.html5-codecs
flatpak uninstall --unused
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
tput setaf 2; echo Dit script is gemaakt door Misha Opstal, Eva Looijestein en Leopold Siccama Hiemstra.
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

##Waiting for user response
read -n 1 -s -r -p "[ANY-KEY]"

##sending positive reaction
echo "!"
tput reset
tput clear

#Continue Dialog
export NCURSES_NO_UTF8_ACS=1
dialog --title "Bevestiging" \
--backtitle "QGIS Installatie - Created by OnTheLink" \
--ok-label "Ga verder" \
--cancel-label "Annuleer" \
--yesno "Wilt u verdergaan?" 0 0

# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
case $response in
   0) 
      ;;
   1) 
      tput reset
      tput clear
      dialog --msgbox "Installatie is gestopt door "$name"" 5 42
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput reset
      tput clear
      dialog --msgbox "[ESC] knop is ingedrukt, \nInstallatie is gestopt" 6 35
      tput reset
      tput clear
      tput sgr0
      exit 255;;
esac

[ $? == 1 ] && exit 0;
[ $? == 255 ] && exit 0;

#CLEAR THE SCREEN
tput reset
tput clear

## Start the Spinner:
spin &

## Make a note of its Process ID (PID):
SPIN_PID=$!

#MESSAGES
COLUMNS=$(tput cols)
echoa="Installatie van QGIS is gestart:"
echob="Tijdelijke map aanmaken"
echoba="Tijdelijke map is aangemaakt!"
echoc="Benodigdheden installeren"
echoca="Benodigdheden zijn geïnstalleerd!"
echod="Flatpak installeren"
echoda="Flatpak is geïnstalleerd!"
echoe="apt hernieuwen"
echoea="apt hernieuwd!"
echof="QGIS installeren"
echoz=""

##Commands after any-keyz
tput sgr0
sudo apt-get --yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 5
printf "%*s\n" $(((${#echoa}+$COLUMNS)/2)) "$echoa"
tput setaf 9
printf "%*s\n" $(((${#echob}+$COLUMNS)/2)) "$echob"
sudo rm -rf /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
mkdir /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
cd /home/"$name"/qgisfiles
tput sgr0
tput setaf 2
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echoba"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echoc}+$COLUMNS)/2)) "$echoc"
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/OTL_QGIS_STRETCH.list
sudo cp -f OTL_QGIS_STRETCH.list /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list
sudo chmod +x /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list
sudo rm -rf "OTL_QGIS_STRETCH.list"
sudo apt-get --yes --assume-yes install wget apt-utils nautilus inotify-tools cron 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoca}+$COLUMNS)/2)) "$echoca"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echod}+$COLUMNS)/2)) "$echod"
tput sgr0
sudo apt-get -t stretch-backports --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoda}+$COLUMNS)/2)) "$echoda"
tput setaf 9
printf "%*s\n" $(((${#echoe}+$COLUMNS)/2)) "$echoe"
tput sgr0
sudo apt-get --yes --assume-yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoea}+$COLUMNS)/2)) "$echoea"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echof}+$COLUMNS)/2)) "$echof"
tput sgr0
sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty
sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/qgis.flatpakref 2> /dev/null | exec 1> /dev/tty
kill -9 $SPIN_PID
tput reset
tput clear
flatpak -y --user install qgis.flatpakref
tput reset
tput clear
sudo -u $name gsettings set org.gnome.software allow-updates false
sudo -u $name gsettings set org.gnome.software download-updates-notify false
sudo -u $name gsettings set org.gnome.software download-updates false
tput reset
tput clear
flatpak -y --user update --commit=f3e180bb9ddc0cc9fc304e899b7c71405d10db81a8200f3d34dfb6288fec15b9 org.qgis.qgis
tput reset
tput clear
sudo -u $name gsettings set org.gnome.software allow-updates false
sudo -u $name gsettings set org.gnome.software download-updates-notify false
sudo -u $name gsettings set org.gnome.software download-updates false
tput reset
tput clear
flatpak -y --user install runtime/org.kde.Platform/x86_64/5.12
tput bold
tput setaf 5
echo "QGIS 3.6 is geïnstalleerd!!!"
sleep 1
tput sgr0
tput setaf 1
echo "Script verlaten in 10 seconden..."
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
sudo rm -rf /home/"$name"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
sudo rm -rf QgisInstaller3.6NL.sh 2> /dev/null | exec 1> /dev/tty
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
tput setaf 2; echo Dit script is gemaakt door Misha Opstal, Eva Looijestein en Leopold Siccama Hiemstra.
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

##Waiting for user response
read -n 1 -s -r -p "[ANY-KEY]"

##sending positive reaction
echo "!"
tput reset
tput clear

#Continue Dialog
export NCURSES_NO_UTF8_ACS=1
dialog --title "Bevestiging" \
--backtitle "QGIS Installatie - Created by OnTheLink" \
--ok-label "Ga verder" \
--cancel-label "Annuleer" \
--yesno "Wilt u verdergaan?" 0 0

# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
case $response in
   0) 
      ;;
   1) 
      tput reset
      tput clear
      dialog --msgbox "Installatie is gestopt door "$name"" 5 42
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput reset
      tput clear
      dialog --msgbox "[ESC] knop is ingedrukt, \nInstallatie is gestopt" 6 35
      tput reset
      tput clear
      tput sgr0
      exit 255;;
esac

[ $? == 1 ] && exit 0;
[ $? == 255 ] && exit 0;

#CLEAR THE SCREEN
tput reset
tput clear

## Start the Spinner:
spin &

## Make a note of its Process ID (PID):
SPIN_PID=$!

#MESSAGES
COLUMNS=$(tput cols)
echoa="Installatie van QGIS is gestart:"
echob="Tijdelijke map aanmaken"
echoba="Tijdelijke map is aangemaakt!"
echoc="Benodigdheden installeren"
echoca="Benodigdheden zijn geïnstalleerd!"
echod="Flatpak installeren"
echoda="Flatpak is geïnstalleerd!"
echoe="apt hernieuwen"
echoea="apt hernieuwd!"
echof="QGIS installeren"
echoz=""

##Commands after any-keyz
tput sgr0
sudo apt-get --yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 5
printf "%*s\n" $(((${#echoa}+$COLUMNS)/2)) "$echoa"
tput setaf 9
printf "%*s\n" $(((${#echob}+$COLUMNS)/2)) "$echob"
sudo rm -rf /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
mkdir /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
cd /home/"$name"/qgisfiles
tput sgr0
tput setaf 2
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echoba"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echoc}+$COLUMNS)/2)) "$echoc"
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/OTL_QGIS_BUSTER.list
sudo cp -f OTL_QGIS_BUSTER.list /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo chmod +x /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo rm -rf "OTL_QGIS_BUSTER.list"
sudo apt-get --yes --assume-yes install wget apt-utils nautilus inotify-tools cron 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoca}+$COLUMNS)/2)) "$echoca"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echod}+$COLUMNS)/2)) "$echod"
tput sgr0
sudo apt-get -t stretch-backports --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoda}+$COLUMNS)/2)) "$echoda"
tput setaf 9
printf "%*s\n" $(((${#echoe}+$COLUMNS)/2)) "$echoe"
tput sgr0
sudo apt-get --yes --assume-yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoea}+$COLUMNS)/2)) "$echoea"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echof}+$COLUMNS)/2)) "$echof"
tput sgr0
sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty
sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/qgis.flatpakref 2> /dev/null | exec 1> /dev/tty
kill -9 $SPIN_PID
tput reset
tput clear
flatpak -y --user install qgis.flatpakref
tput reset
tput clear
sudo -u $name gsettings set org.gnome.software allow-updates false
sudo -u $name gsettings set org.gnome.software download-updates-notify false
sudo -u $name gsettings set org.gnome.software download-updates false
tput reset
tput clear
flatpak -y --user update --commit=f3e180bb9ddc0cc9fc304e899b7c71405d10db81a8200f3d34dfb6288fec15b9 org.qgis.qgis
tput reset
tput clear
sudo -u $name gsettings set org.gnome.software allow-updates false
sudo -u $name gsettings set org.gnome.software download-updates-notify false
sudo -u $name gsettings set org.gnome.software download-updates false
tput reset
tput clear
flatpak -y --user install runtime/org.kde.Platform/x86_64/5.12
tput bold
tput setaf 5
echo "QGIS 3.6 is geïnstalleerd!!!"
sleep 1
tput sgr0
tput setaf 1
echo "Script verlaten in 10 seconden..."
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
sudo rm -rf /home/"$name"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
sudo rm -rf QgisInstaller3.6NL.sh 2> /dev/null | exec 1> /dev/tty
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
  sudo rm -rf /home/"$name"/qgisbestanden 2> /dev/null | exec 1> /dev/tty
  sudo rm -rf QgisInstaller3.6NL.sh 2> /dev/null | exec 1> /dev/tty
  tput reset
  tput clear
  tput sgr0
  exit
;;
esac
