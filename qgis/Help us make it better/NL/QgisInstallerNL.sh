#!/bin/bash

#Terminal leegmaken voordat het script uitvoert
tput reset

#Verwijderen van oudere versie van het script
tput bold && tput setaf 5; echo "Oudere versies verwijderen..." && exec 1> log.txt sudo apt-get --yes --assume-yes remove wget apt-utils nautilus 2> /dev/null | exec 1> /dev/tty && sudo flatpak uninstall org.qgis.qgis && exec 1> log.txt sudo apt-get --yes --assume-yes remove flatpak 2> /dev/null | exec 1> /dev/tty && crontab -r && tput sgr0

#Script daadwerkelijke starten
tput reset

#Informatie over de makers van het script en over het script zelf
tput setaf 2; echo Dit script is gemaakt door Misha Opstal en Leopold Siccama Hiemstra.
echo Het script zal QGIS installeren op uw chromebook.
echo Flatpak wordt gebruikt voor het belangrijkste deel van de installatie!
echo Wij zijn niet de makers van QGIS of flatpak en dit is een onofficieel script.
echo "Onze website: https://onthelink.tk"
echo "De Flatpak website: https://flatpak.org"
echo Alvast bedankt voor het gebruiken van ons script!
tput bold && tput setaf 1; echo -----------------------------------
tput bold && tput setaf 5; echo           INSTALLATIE IS GESTART
tput bold && tput setaf 1; echo -----------------------------------
tput sgr0 && tput setaf 4; echo "WAARSCHUWING: Het wordt aangeraden om altijd een stabiele internetverbinding te hebben en niet op ctrl+c te drukken (Wanneer u dit doet zult u de chromebook moeten resetten met een herstel-usb of via powerwash)" && tput sgr0

#Kill Switch, wordt geactiveerd wanneer ctrl+c wordt ingedrukt (herinstallatie benodigt van de chromebook nadat de gebruiker dit doet indien hij hierna toch QGIS wilt)
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        echo "** Kill Switch is geactiveerd" && reboot
}

for i in `seq 1 5`; do
    sleep 1
    echo -n "."
done

#Wachten op reactie van de gebruiker
read -n 1 -s -r -p "Druk op een willekeurige toets om verder te gaan..."

#Commando's nadat de gebruiker heeft gedrukt op de willekeurige toets
echo ";)" && tput sgr0 && exec 1> log.txt sudo apt-get --yes update | exec 1> /dev/tty && tput setaf 5; echo "Installatie van QGIS gestart:" && tput setaf 6; echo "Tijdelijke map aanmaken en onnodige bestanden verwijderen..." && mkdir qgisbestanden && cd qgisbestanden && tput sgr0 && tput setaf 2; echo "De tijdelijke map is aangemaakt!" && tput sgr0 && tput setaf 6; echo "Benodigdheden installeren..." && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes install wget apt-utils nautilus inotify-tools 2> /dev/null | exec 1> /dev/tty && tput setaf 2; echo "Benodigdheden geïnstalleerd!" && tput sgr0 && tput setaf 6; echo "Flatpak installeren..." && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty && tput setaf 2; echo "Flatpak is geïnstalleerd!" && tput setaf 6; echo "apt vernieuwen:" && tput sgr0 && exec 1> log.txt 2> /dev/null | sudo apt-get --yes --assume-yes update | exec 1> /dev/tty && tput setaf 2; echo "apt vernieuwd!" && tput sgr0 && tput setaf 6; echo "QGIS installeren..." && tput sgr0 && sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty && sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/qgis.flatpakref 2> /dev/null && flatpak -y install qgis.flatpakref && tput reset && tput bold && tput setaf 5; echo "QGIS is geïnstalleerd!!!" 2> /dev/tty && sleep 1 && tput sgr0 && tput setaf 4; echo "De nieuwe crontab installeren..." 2> /dev/tty && crontab -l | { cat; echo "*/1 * * * * rsync -a /run/user/1000/doc/by-app/org.qgis.qgis /home/$USER"; } | crontab - && tput setaf 5; echo "De nieuwe crontab is geïnstalleerd!" && tput setaf 1; echo "Beeindigen van script in 10 seconden..." && sleep 5 && tput setaf 1; echo "5" && sleep 1 && tput setaf 1; echo "4" && sleep 1 && tput setaf 1; echo "3" && sleep 1 && tput setaf 1; echo "2" && sleep 1 && tput setaf 1; echo "1" && sleep 1 && tput setaf 2; echo "Vaarwel!" && sleep 1 && exit