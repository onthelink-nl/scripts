#!/bin/bash

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

#Resetting terminal
tput reset
tput clear

#stop spinner
kill -9 $SPIN_PID

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will remove AnyDesk on your Linux device (Debian based)."
tput bold; echo "We are not the creators of AnyDesk and this is an unofficial script, we do NOT claim AnyDesk as our content and all copyright goes to AnyDesk Software GmbH"
tput setaf 5; echo -n "Our Discord: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOnTheLink official Discord server\e]8;;\a'
echo -n "The AnyDesk website: "
echo -e '\e]8;;https://anydesk.com/\aAnyDesk\e]8;;\a'
tput setaf 69; echo "Thank you for using our uninstaller!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>UNINSTALLER+ STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while installing AnyDesk" && tput sgr0

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#sending positive reaction
echo ";)"

#Create backup?
tput reset
tput clear
tput setaf 3
echo -n "Do you want to create a backup? (can only be restored using our installer script..) (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    # Creating local backup directories
mkdir /home/$USER/.anydeskbackup
cd /home/$USER/.anydeskbackup
mkdir local
mkdir system

# Checking local file
ls /home/$USER/.anydesk/ | grep service.conf > /dev/null

# check output of the previous command
if [ $? -eq 0 ]
then
    tput sgr0
	tput setaf 6
	echo -e "We found the configuration file for 'local'!, creating backup...." > /dev/tty
	tput sgr0
    sudo cp /home/$USER/.anydesk/service.conf /home/$USER/.anydeskbackup/local/ > /dev/null
	tput reset
	tput setaf 2
	echo -e "Backup has been created! if you wan't to restore your backup please use our AnyDesk installer script" > /dev/tty
	tput sgr0
	sleep 4
else
    echo -e "Configuration file wasn't local or doesn't exist, checking if this was a system install..."
	sleep 2
	tput reset
	# Checking systemwide file
ls /etc/anydesk/ | grep service.conf > /dev/null

# check output of the previous command
if [ $? -eq 0 ]
then
    tput sgr0
	tput setaf 6
	echo -e "We found the configuration file for 'systemwide'!, creating backup...." > /dev/tty
	tput sgr0
    sudo cp /etc/anydesk/service.conf /home/$USER/.anydeskbackup/system/ > /dev/null
	tput reset
	tput setaf 2
	echo -e "Backup has been created! if you wan't to restore your backup please use our AnyDesk installer script" > /dev/tty
	tput sgr0
	sleep 4
else
    echo -e "Configuration file doesn't exist or couldn't be found, this could happen because the file of configuration has another name in a newer update or it was removed from the device.. Backup creation is not possible until the configuration file (service.conf) is back in place..."
	sleep 2
	tput reset
fi
else
    echo "Okay, we won't create a backup"
fi
fi

# Start the Spinner:
spin &

# Make a note of its Process ID (PID):
SPIN_PID=$!

#Removing AnyDesk
sudo rm -rf "/etc/apt/sources.list.d/anydesk-stable.list"
sudo apt-key del CDFFDE29
sudo apt-get --yes --assume-yes --purge remove anydesk*
sudo apt-get --yes --assume-yes update
tput setaf 2
echo "AnyDesk has been removed from your system"
sleep 5
tput sgr0
tput reset

#stop spinner
kill -9 $SPIN_PID

#Removing local script files
cd -
sudo rm -rf "/etc/apt/scripts/anydeskremoval.sh"
sudo head -n -1 /home/$USER/.bashrc > /home/$USER/bashrc.new ; sudo mv /home/$USER/bashrc.new /home/$USER/.bashrc

#Waiting for user input
read -n 1 -s -r -p "press any key to exit..."

#Quit
tput reset
tput sgr0
tput clear
exit