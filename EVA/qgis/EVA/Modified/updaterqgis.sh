#!/bin/bash
  if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  qgisu="/etc/init.d/qgisconfigupdater.sh"
if [ -f "$qgisu" ]; then
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgisconfigupdater.sh
	sudo cp -f qgisconfigupdater.sh /etc/init.d/qgisconfigupdater.sh
	sudo chmod +x /etc/init.d/qgisconfigupdater.sh
	sudo rm -rf "qgisconfigupdater.sh"
else
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/qgisconfigupdater.sh
	sudo cp -f qgisconfigupdater.sh /etc/init.d/qgisconfigupdater.sh
	sudo chmod +x /etc/init.d/qgisconfigupdater.sh
	sudo rm -rf "qgisconfigupdater.sh"
fi
DISPLAY=:0 x-terminal-emulator -e bash /etc/init.d/qgisconfigupdater.sh

else
bash /etc/init.d/updaterqgis.sh
exit
fi

exit
