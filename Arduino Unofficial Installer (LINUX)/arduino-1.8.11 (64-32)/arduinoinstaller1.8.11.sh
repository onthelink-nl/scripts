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

spin()
{
  spinner="-\\|/-\\|/"
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

echo "About to start the installer..."
sleep 2
echo "Here we go!!!"
sleep 1

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!
# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 6 30`

#Remove older files
sudo rm -rf /opt/arduino-1.8.11/*
sudo rm -rf /opt/arduino-1.8.11*
sudo rm -rf /home/$USER/arduinoinstaller*
sudo apt-get --yes --assume-yes update

#stop spinner
kill -9 $SPIN_PID

#Clear terminal before execution of the script
tput reset
tput clear

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64-bit stuff here
#Creating temp folder for installation files
sudo rm -rf /home/$USER/arduinoinstaller*
mkdir /home/$USER/arduinoinstaller1_8_11
cd /home/$USER/arduinoinstaller1_8_11

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will install arduino version 1.8.11 (64-Bit) on your Linux device."
tput bold; echo "We are not the creators of arduino and this is an unofficial script, we do NOT claim arduino as our content and all copyrights, trademarks and other intellectual property belong to Arduino AG!"
tput setaf 5; echo -n "Our Discord Server: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOTL Discord server\e]8;;\a'
echo -n "The arduino website: "
echo -e '\e]8;;https://www.arduino.cc/\aArduino\e]8;;\a'
tput setaf 69; echo "Thank you for using our script!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while installing arduino" && tput sgr0
tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#sending positive reaction
tput setaf 6
echo ";)"
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

# Start the Spinner:
spin &

# Make a note of its Process ID (PID):
SPIN_PID=$!

#Installing/updating
tput setaf 1
echo "Installing dependencies"
tput setaf 6
sudo apt-get --yes --assume-yes install wget curl tar 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Dependencies have been installed"
tput setaf 1
echo "Downloading version 1.8.11 64-Bit..."
tput setaf 6
sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Arduino%20Unofficial%20Installer%20(LINUX)/arduino-1.8.11%20(64-32)/arduino-1.8.11-linux64.tar.xz"
tput setaf 2
echo "Files have been downloaded"
sleep 1
tput setaf 1
echo "Extracting Installation Files..."
tput setaf 6
tar -Jxf arduino-1.8.11-linux64.tar.xz
tput setaf 2
echo "Installation Files Extracted!"
tput setaf 1
echo "Moving Files..."
tput setaf 6
sudo mv arduino-1.8.11 /opt
cd /opt/arduino-1.8.11/
tput setaf 2
echo "Files have been moved!"
tput setaf 1
echo "Installing Arduino..."

#stop spinner
kill -9 $SPIN_PID

tput setaf 6
sudo ./install.sh
sleep 2
tput sgr0
tput reset
tput setaf 2
tput bold
echo "Arduino Version 1.8.11 64-Bit is now installed on your system!"
tput sgr0

#Removing local script files
cd $STARTDIR
sudo rm -rf "arduinoinstaller1.8.11.sh"
sudo rm -rf /home/$USER/arduinoinstaller*

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#sending positive reaction
tput setaf 6
echo ";)"

#quit
tput reset
tput sgr0
tput clear
exit

else
  # 32-bit stuff here
#Creating temp folder for installation files
sudo rm -rf /home/$USER/arduinoinstaller*
mkdir /home/$USER/arduinoinstaller1_8_11
cd /home/$USER/arduinoinstaller1_8_11

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will install arduino version 1.8.11 (32-Bit) on your Linux device."
tput bold; echo "We are not the creators of arduino and this is an unofficial script, we do NOT claim arduino as our content and all copyrights, trademarks and other intellectual property belong to Arduino AG!"
tput setaf 5; echo -n "Our Discord Server: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOTL Discord server\e]8;;\a'
echo -n "The arduino website: "
echo -e '\e]8;;https://www.arduino.cc/\aArduino\e]8;;\a'
tput setaf 69; echo "Thank you for using our script!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while installing arduino" && tput sgr0
tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#sending positive reaction
tput setaf 6
echo ";)"
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

# Start the Spinner:
spin &

# Make a note of its Process ID (PID):
SPIN_PID=$!

#Installing/updating
tput setaf 1
echo "Installing dependencies"
tput setaf 6
sudo apt-get --yes --assume-yes install wget curl tar 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Dependencies have been installed"
tput setaf 1
echo "Downloading version 1.8.11 32-Bit..."
tput setaf 6
sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Arduino%20Unofficial%20Installer%20(LINUX)/arduino-1.8.11%20(64-32)/arduino-1.8.11-linux32.tar.xz"
tput setaf 2
echo "Files have been downloaded"
sleep 1
tput setaf 1
echo "Extracting Installation Files..."
tput setaf 6
tar -Jxf arduino-1.8.11-linux32.tar.xz
tput setaf 2
echo "Installation Files Extracted!"
tput setaf 1
echo "Moving Files..."
tput setaf 6
sudo mv arduino-1.8.11 /opt
cd /opt/arduino-1.8.11/
sudo chmod +x install.sh
tput setaf 2
echo "Files have been moved!"
tput setaf 1
echo "Installing Arduino..."

#stop spinner
kill -9 $SPIN_PID

tput setaf 6
sudo ./install.sh
sleep 2
tput sgr0
tput reset
tput setaf 2
tput bold
echo "Arduino Version 1.8.11 32-Bit is now installed on your system!"
tput sgr0

#Removing local script files
cd $STARTDIR
sudo rm -rf "arduinoinstaller1.8.11.sh"
sudo rm -rf /home/$USER/arduinoinstaller*

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#sending positive reaction
tput setaf 6
echo ";)"

#quit
tput reset
tput sgr0
tput clear
exit
fi
