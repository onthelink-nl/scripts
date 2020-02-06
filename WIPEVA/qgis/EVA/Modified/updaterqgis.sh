#!/bin/bash
  qgisu="/etc/init.d/qgisconfigupdater.sh"
if [ -f "$qgisu" ]; then
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisconfigupdater.sh
	sudo cp -f qgisconfigupdater.sh /etc/init.d/qgisconfigupdater.sh
	sudo chmod +x /etc/init.d/qgisconfigupdater.sh
	sudo rm -rf "qgisconfigupdater.sh"
else
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/WIPEVA/qgis/EVA/Modified/qgisconfigupdater.sh
	sudo cp -f qgisconfigupdater.sh /etc/init.d/qgisconfigupdater.sh
	sudo chmod +x /etc/init.d/qgisconfigupdater.sh
	sudo rm -rf "qgisconfigupdater.sh"
fi
DISPLAY=:0 x-terminal-emulator -e bash /etc/init.d/qgisconfigupdater.sh
exit
