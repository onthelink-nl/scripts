#!/bin/bash

spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
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

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!
# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 0 15`

#Terminal leegmaken voordat het script uitvoert
tput reset

#Verwijderen van oudere versie van het script
tput bold && tput setaf 5; echo "Oudere versies verwijderen..."
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
sudo apt-get --yes --assume-yes remove --purge flatpak
sudo apt-get --yes --assume-yes clean
sudo apt-get --yes --assume-yes autoremove --purge
sudo apt-get --yes --assume-yes clean
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
sudo rm -rf "/home/$USER/.var/app/org.qgis.qgis"
sudo rm -rf "/home/$USER/.var/app/org.kde.Platform"
sudo rm -rf "/home/$USER/.var/app/org.freedesktop.Platform.html5-codecs"
sudo mv "/home/$USER/.var/app/org.qgis.qgis"
sudo mv "/home/$USER/.var/app/org.kde.Platform"
sudo mv "/home/$USER/.var/app/org.freedesktop.Platform.html5-codecs"

#stop spinner
kill -9 $SPIN_PID

#Script daadwerkelijke starten
tput reset

#Informatie over de makers van het script en over het script zelf
tput setaf 2; echo Dit script is gemaakt door Misha Opstal en Leopold Siccama Hiemstra.
echo Het script zal QGIS installeren op uw chromebook.
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
tput sgr0 && tput setaf 4; echo "WAARSCHUWING: Het wordt aangeraden om altijd een stabiele internetverbinding te hebben en niet op ctrl+c te drukken (Wanneer u dit doet zult u de chromebook moeten resetten met een herstel-usb of via powerwash)" && tput sgr0

#Wachten op reactie van de gebruiker
read -n 1 -s -r -p "Druk op een willekeurige toets om verder te gaan..."

#sending positive reaction
echo ";)"

# Start the Spinner:
spin &

# Make a note of its Process ID (PID):
SPIN_PID=$!


#Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
tput sgr0 && exec 1> log.txt sudo apt-get --yes update | exec 1> /dev/tty && tput setaf 5; echo "Installatie van QGIS gestart:" && tput setaf 9; echo "Tijdelijke map aanmaken" && mkdir qgisbestanden && cd qgisbestanden && tput sgr0 && tput setaf 2; echo "De tijdelijke map is aangemaakt!" && tput sgr0 && tput setaf 9; echo "Benodigdheden installeren..." && tput sgr0 && sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/qgis/MUFU/Modified/OTL.list && sudo cp -f OTL.list /etc/apt/sources.list.d/OTL.list && sudo chmod +x /etc/apt/sources.list.d/OTL.list && sudo rm -rf "OTL.list" && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes install wget apt-utils nautilus inotify-tools cron 2> /dev/null | exec 1> /dev/tty && tput setaf 2; echo "Benodigdheden geïnstalleerd!" && tput sgr0 && tput setaf 9; echo "Flatpak installeren..." && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get -t stretch-backports --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty && tput setaf 2; echo "Flatpak is geïnstalleerd!" && tput setaf 9; echo "apt vernieuwen:" && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes update | exec 1> /dev/tty && tput setaf 2; echo "apt vernieuwd!" && tput sgr0 && tput setaf 9; echo "QGIS installeren..." && tput sgr0 && sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty && sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-nl/scripts/master/qgis/qgis.flatpakref 2> /dev/null && kill -9 $SPIN_PID && flatpak -y install qgis.flatpakref && tput reset && tput bold && tput setaf 5; echo "QGIS is geïnstalleerd!!!" 2> /dev/tty && sleep 1 && tput sgr0 && tput setaf 1; echo "Beeindigen van script in 10 seconden..." && sleep 5 && tput setaf 1; echo "5" && sleep 1 && tput setaf 1; echo "4" && sleep 1 && tput setaf 1; echo "3" && sleep 1 && tput setaf 1; echo "2" && sleep 1 && tput setaf 1; echo "1" && sleep 1 && tput setaf 2; echo "Vaarwel!" && sleep 1 && tput reset && exit
