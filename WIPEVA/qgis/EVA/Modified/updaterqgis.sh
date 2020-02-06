#!/bin/bash
DISPLAY=:0 xterm +u8 -title UPDATER -fg yellow -bg black -e bash -c "while true; do bash /etc/init.d/qgisconfigupdater.sh; done"
exit
