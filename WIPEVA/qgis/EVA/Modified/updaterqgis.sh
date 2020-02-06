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
DISPLAY=:0 xterm +u8 -title UPDATER -fg yellow -bg black -e bash -c "while true; do bash /etc/init.d/qgisconfigupdater.sh; done"
exit
