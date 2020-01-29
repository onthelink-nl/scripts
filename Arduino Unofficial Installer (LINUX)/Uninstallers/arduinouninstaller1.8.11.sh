#!/bin/bash

#Get current path (Required for completion removal of install files)
STARTDIR="$(pwd)"

#Clearing terminal before starting
tput sgr0
tput reset
tput clear

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        tput reset && tput clear && tput sgr0 && exit
}

for i in `seq 1 5`; do
    sleep 1
    echo -n "."
done

tput sgr0
tput reset
tput clear

echo "About to start the uninstaller..."
sleep 2
echo "Here we go!!!"
sleep 1
tput reset
tput clear

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will remove arduino 1.8.11 from your Linux device."
tput bold; echo "We are not the creators of arduino and this is an unofficial script, we do NOT claim arduino as our content and all copyrights, trademarks and other intellectual property belong to Arduino AG!"
tput setaf 5; echo -n "Our Discord: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOnTheLink official Discord server\e]8;;\a'
echo -n "The arduino website: "
echo -e '\e]8;;https://www.arduino.cc/\aArduino\e]8;;\a'
tput setaf 69; echo "Thank you for using our uninstaller!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>UNINSTALLER STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while uninstalling arduino" && tput sgr0
tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "Do you want to continue? (CTRL+C to cancel)..."

#sending positive reaction
tput setaf 6
echo ";)"

#There we go
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
echo "Here we go!"
sleep 1
tput reset
tput clear

#Naar Arduino1.8.11 installatie
cd /opt/arduino-1.8.11/

#Arduino verwijderen
tput setaf 6
sudo ./uninstall.sh
sleep 2
tput sgr0

#Remove leftover folders
cd $STARTDIR
sudo rm -rf /opt/arduino-1.8.11/
sudo rm -rf /opt/arduino-1.8.11*
sudo rm -rf /opt/arduino-1.8.11
sudo rm -rf /home/$USER/Arduino/
sudo rm -rf /home/$USER/Arduino*
sudo rm -rf /home/$USER/Arduino
sudo rm -rf /home/$USER/.arduino15/
sudo rm -rf /home/$USER/.arduino15*
sudo rm -rf /home/$USER/.arduino15

#Done
tput reset
tput clear
tput setaf 2
echo "arduino has been uninstalled!"

tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "press any key to exit..."

#Clear terminal before exiting the script
sudo rm -rf /home/$USER/arduinoinstaller*
sudo rm -rf arduinouninstaller.sh
tput reset
tput sgr0
tput clear
exit
