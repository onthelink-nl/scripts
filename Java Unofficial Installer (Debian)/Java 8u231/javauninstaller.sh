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

echo "About to start the uninstaller..."
sleep 2
echo "Here we go!!!"
sleep 1

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will remove Java on your Linux device (Debian based)."
tput bold; echo "We are not the creators of Java and this is an unofficial script, we do NOT claim Java as our content and all copyrights, trademarks and other intellectual property belong to the Oracle Corporation!"
tput setaf 5; echo -n "Our Discord: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOnTheLink official Discord server\e]8;;\a'
echo -n "The Java website: "
echo -e '\e]8;;https://www.oracle.com/java/\aJava\e]8;;\a'
tput setaf 69; echo "Thank you for using our uninstaller!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>UNINSTALLER STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while uninstalling Java" && tput sgr0
tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "Do you want to continue? (Close terminal to cancel)..."

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
# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 0 15`

#Remove older files
sudo update-alternatives --remove java /opt/jdk/*
sudo update-alternatives --remove javac /opt/jdk/*
sudo rm -rf /opt/jdk/*
sudo rm -rf /opt/jdk
sudo rm -rf /home/$USER/javainstaller*
sudo apt-get --yes --assume-yes update

#stop spinner
kill -9 $SPIN_PID

#Done
tput reset
tput clear
tput setaf 2
echo "Java has been uninstalled!"

tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "press any key to exit..."

#Clear terminal before exiting the script
sudo rm -rf "javainstaller8.sh"
tput reset
tput sgr0
tput clear
exit
