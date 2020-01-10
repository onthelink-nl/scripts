#!/bin/bash

#Clearing terminal before starting
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
trap "kill -9 $SPIN_PID" `seq 0 15`

#Remove older files
sudo update-alternatives --remove java /opt/jdk/*
sudo update-alternatives --remove javac /opt/jdk/*
sudo rm -rf /opt/jdk/*
sudo rm -rf /opt/jdk
sudo apt-get --yes --assume-yes update

#stop spinner
kill -9 $SPIN_PID

#Clear terminal before execution of the script
tput reset
tput clear

#Creating temp folder for installation files
mkdir /home/$USER/javainstaller9_0_4
cd /home/$USER/javainstaller9_0_4

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will install the Java JDK version 9.0.4 on your Linux device (Debian based)."
tput bold; echo "We are not the creators of Java and this is an unofficial script, we do NOT claim Java as our content and all copyrights, trademarks and other intellectual property belong to the Oracle Corporation!"
tput setaf 5; echo -n "Our Discord Server: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOTL Discord server\e]8;;\a'
echo -n "The Java website: "
echo -e '\e]8;;https://www.oracle.com/java/\aJava\e]8;;\a'
tput setaf 69; echo "Thank you for using our script!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while installing Java" && tput sgr0
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
echo "Downloading version 9.0.4..."
tput setaf 6
sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Java%20Unofficial%20Installer%20(Debian)/Java%209.0.4/jdk-9.0.4_linux-x64_bin.tar.gz"
tput setaf 2
echo "Files have been downloaded"
sleep 1
tput setaf 1
echo "Creating installation directories..."
tput setaf 6
sudo mkdir /opt/jdk
tput setaf 2
echo "Installation directories created"
tput setaf 1
echo "Extracting installation files..."
tput setaf 6
sudo tar -zxf jdk-9.0.4_linux-x64_bin.tar.gz -C /opt/jdk
tput setaf 2
echo "Installation files extracted"
tput setaf 1
echo "Copying files..."
sudo update-alternatives --install /usr/bin/java java /opt/jdk/jdk-9.0.4/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk-9.0.4/bin/javac 100
sleep 2
tput sgr0
tput reset
tput setaf 2
tput bold
echo "Java JDK Version 9.0.4 is now installed on your system!"
tput sgr0

#stop spinner
kill -9 $SPIN_PID

#Removing local script files
cd -
sudo rm -rf "javainstaller9.sh"
sudo rm -rf "/home/$USER/javainstaller*"

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
