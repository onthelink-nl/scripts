#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

MACHINE_VERSION=`cat /etc/debian_version`
case $MACHINE_VERSION in
9|9.1|9.2|9.3|9.4|9.5|9.6|9.7|9.8|9.9)
   # Stretch stuff here

#Check if update available
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  tput setaf 3
  echo "Connected to the internet!"
  tput reset
  tput clear
  tput sgr0
  qgisr="/etc/init.d/qgisremovefiles.sh"
  qgisc="/etc/init.d/qgiscopyfiles.sh" 
  qgisu="/etc/init.d/qgisconfigupdater.sh"
if [ -f "$qgisr" ]; then
    tput setaf 3
	echo "qgisremovefiles script was found! updating..."
	tput setaf 6
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisremovefiles.sh
	sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
	sudo chmod +x /etc/init.d/qgisremovefiles.sh
	sudo rm -rf "qgisremovefiles.sh"
	crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
	crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab -
	tput setaf 2
	echo "qgisremovefiles updated!"
	sleep 2
    tput reset
	tput clear
	tput sgr0
else
	tput setaf 1
	echo "qgisremovefiles script was not found, skipping..!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
fi

if [ -f "$qgisc" ]; then
	tput setaf 3
	echo "qgiscopyfiles script was found! updating..."
	tput setaf 6
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgiscopyfiles.sh
	sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
	sudo chmod +x /etc/init.d/qgiscopyfiles.sh
	sudo rm -rf "qgiscopyfiles.sh"
	crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
	crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab -
	tput setaf 2
	echo "qgiscopyfiles updated!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
else
	tput setaf 1
	echo "qgisremovefiles script was not found, downloading...!"
	tput setaf 6
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgiscopyfiles.sh
	sleep 1
	tput setaf 3
	echo "Updating..."
	sleep 1
	tput setaf 6
	sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
	sudo chmod +x /etc/init.d/qgiscopyfiles.sh
	sudo rm -rf "qgiscopyfiles.sh"
	crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
	crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab -
	tput setaf 2
	echo "qgiscopyfiles updated!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
fi

if [ -f "$qgisu" ]; then
    tput setaf 3
	echo "qgisconfigupdater script was found! updating..."
	tput setaf 6
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisconfigupdater.sh
	sudo cp -f qgisconfigupdater.sh /etc/init.d/qgisconfigupdater.sh
	sudo chmod +x /etc/init.d/qgisconfigupdater.sh
	sudo rm -rf "qgisconfigupdater.sh"
	crontab -l | grep -v '*/5 * * * * /bin/bash /etc/init.d/qgisconfigupdater.sh' | crontab -
	crontab -l | { cat; echo "*/5 * * * * /bin/bash /etc/init.d/qgisconfigupdater.sh"; } | crontab -
	tput setaf 2
	echo "qgisconfigupdater updated!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
else
	tput setaf 1
	echo "qgisconfigupdater.sh script was not found, downloading...!"
	tput setaf 6
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisconfigupdater.sh
	sleep 1
	tput setaf 3
	echo "Updating..."
	sleep 1
	tput setaf 6
	sudo cp -f qgisconfigupdater.sh /etc/init.d/qgisconfigupdater.sh
	sudo chmod +x /etc/init.d/qgisconfigupdater.sh
	sudo rm -rf "qgisconfigupdater.sh"
	crontab -l | grep -v '*/5 * * * * /bin/bash /etc/init.d/qgisconfigupdater.sh' | crontab -
	crontab -l | { cat; echo "*/5 * * * * /bin/bash /etc/init.d/qgisconfigupdater.sh"; } | crontab -
	tput setaf 2
	echo "qgisconfigupdater updated!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
fi

exit

else
  tput reset
	tput clear
	tput sgr0
  exit
fi
;;
10|10.1|10.2|10.3|10.4|10.5|10.6|10.7|10.8|10.9)
   ## Buster stuff here

#Check if update available
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "Connected to the internet!"
  qgisr="/etc/init.d/qgisremovefiles.sh"
  qgisc="/etc/init.d/qgiscopyfiles.sh" 
  qgisu="/etc/init.d/qgisconfigupdater.sh"
if [ -f "$qgisr" ]; then
    tput setaf 3
	echo "qgisremovefiles script was found! updating..."
	tput setaf 6
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisremovefiles.sh
	sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
	sudo chmod +x /etc/init.d/qgisremovefiles.sh
	sudo rm -rf "qgisremovefiles.sh"
	crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
	crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab -
	echo "qgisremovefiles updated!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
else
	tput setaf 1
	echo "qgisremovefiles script was not found, skipping..!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
fi

if [ -f "$qgisc" ]; then
	tput setaf 3
	echo "qgiscopyfiles script was found! removing..."
	tput setaf 6
	crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
	sudo rm -rf "/etc/init.d/qgiscopyfiles.sh"
	tput setaf 2
	echo "qgiscopyfiles removed!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
else
	tput setaf 1
	echo "qgiscopyfiles was not found, skipping..!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
fi

if [ -f "$qgisu" ]; then
    tput setaf 3
	echo "qgisconfigupdater script was found! updating..."
	tput setaf 6
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisconfigupdater.sh
	sudo cp -f qgisconfigupdater.sh /etc/init.d/qgisconfigupdater.sh
	sudo chmod +x /etc/init.d/qgisconfigupdater.sh
	sudo rm -rf "qgisconfigupdater.sh"
	crontab -l | grep -v '*/5 * * * * /bin/bash /etc/init.d/qgisconfigupdater.sh' | crontab -
	crontab -l | { cat; echo "*/5 * * * * /bin/bash /etc/init.d/qgisconfigupdater.sh"; } | crontab -
	echo "qgisconfigupdater updated!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
else
	tput setaf 1
	echo "qgisconfigupdater.sh script was not found, downloading...!"
	tput setaf 6
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisconfigupdater.sh
	sleep 1
	tput setaf 3
	echo "Updating..."
	tput setaf 6
	sudo cp -f qgisconfigupdater.sh /etc/init.d/qgisconfigupdater.sh
	sudo chmod +x /etc/init.d/qgisconfigupdater.sh
	sudo rm -rf "qgisconfigupdater.sh"
	crontab -l | grep -v '*/5 * * * * /bin/bash /etc/init.d/qgisconfigupdater.sh' | crontab -
	crontab -l | { cat; echo "*/5 * * * * /bin/bash /etc/init.d/qgisconfigupdater.sh"; } | crontab -
	tput setaf 2
	echo "qgisconfigupdater updated!"
	sleep 2
	tput reset
	tput clear
	tput sgr0
fi

else
  exit
fi
;;
*)
## FAILSAFE
sleep 3
  cd $STARTDIR
  exit
;;
esac