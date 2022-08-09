#!/bin/bash

#Get current user
name="$(logname)"

STARTDIR="$(pwd)"
cd /home/"$name"/

MACHINE_VERSION=`cat /etc/debian_version`
case $MACHINE_VERSION in
11|11.1|11.2|11.3|11.4|11.5|11.6|11.7|11.8|11.9)
   ## BULLSEYE stuff here

#Check if update available
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  qgisr="/etc/init.d/qgisremovefiles.sh"
  qgisc="/etc/init.d/qgiscopyfiles.sh" 
  qgisp="/etc/init.d/protectionsoftware.sh" 
if [ -f "$qgisp" ]; then
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/protectionsoftware.sh
	sudo cp -f protectionsoftware.sh /etc/init.d/protectionsoftware.sh
	sudo chmod +x /etc/init.d/protectionsoftware.sh
	sudo rm -rf "protectionsoftware.sh"
	crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/protectionsoftware.sh' | crontab -
	crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/protectionsoftware.sh"; } | crontab -
fi

if [ -f "$qgisr" ]; then
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgisremovefiles.sh
	sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
	sudo chmod +x /etc/init.d/qgisremovefiles.sh
	sudo rm -rf "qgisremovefiles.sh"
	crontab -l | grep -v '@reboot /bin/bash /etc/init.d/qgisremovefiles.sh' | crontab -
	crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab -
fi

if [ -f "$qgisc" ]; then
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
	sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
	sudo chmod +x /etc/init.d/qgiscopyfiles.sh
	sudo rm -rf "qgiscopyfiles.sh"
	crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
	crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab -
else
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/qgiscopyfiles.sh
	sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
	sudo chmod +x /etc/init.d/qgiscopyfiles.sh
	sudo rm -rf "qgiscopyfiles.sh"
	crontab -l | grep -v '* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh' | crontab -
	crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab -
fi
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BULLSEYE.list
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/VOU/qgis/VOU/Modified/OTL_QGIS_BULLSEYE.list
sudo cp -f OTL_QGIS_BULLSEYE.list /etc/apt/sources.list.d/OTL_QGIS_BULLSEYE.list
sudo chmod +x /etc/apt/sources.list.d/OTL_QGIS_BULLSEYE.list
sudo rm -rf "OTL_QGIS_BULLSEYE.list"
else
  exit
fi
;;
*)
## FAILSAFE
  cd $STARTDIR
  exit
;;
esac
