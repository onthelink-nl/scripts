#!/bin/bash

##Kill Switch, will be activated when ctrl+c is pressed (Sometimes the chromebooks need to be powerwashed or reset by a recovery to make QGIS work after this)
##trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        echo "** Nice try!" && exit
}

for i in `seq 1 5`; do
    sleep 1
    echo -n "."
done

##Resetting Terminal
tput reset
tput clear
tput sgr0

##UpdaterQGIS
tput setaf 2; echo "OnTheLink - TERMINAL PROTECTION SOFTWARE"
sleep 1
tput setaf 6; echo "Checking for qgis updates..."
sleep 2
bash /etc/init.d/updaterqgis.sh
sleep 2
tput setaf 2; echo UPDATED!
sleep 1

##Resetting Terminal again
tput reset
tput clear
tput sgr0

##Ask for the Password
ACTUAL="$password"
read -s -p "Password: " enteredpass
echo ""

[ "$enteredpass" != "$ACTUAL" ] && tput setaf 1 && echo "Sorry" && echo "Exiting Terminal..." && tput reset && tput clear && tput sgr0 && exit 1
[ "$enteredpass" == "$ACTUAL" ] && tput setaf 2 && echo "Correct" && echo "Opening Terminal..." && tput reset && tput clear && tput sgr0 && exit 0
