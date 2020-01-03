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

#Remove older repo-files
sudo rm -rf "/etc/apt/sources.list.d/anydesk-stable.list"
sudo apt-key del CDFFDE29
sudo apt-get --yes --assume-yes update

#stop spinner
kill -9 $SPIN_PID

#Clear terminal before execution of the script
tput reset
tput clear

#Creating temp folder for installation files
mkdir /home/$USER/anydeskinstaller
cd /home/$USER/anydeskinstaller

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will install AnyDesk version LATEST on your Linux device (Debian based)."
tput bold; echo "We are not the creators of AnyDesk and this is an unofficial script, we do NOT claim AnyDesk as our content and all copyright goes to AnyDesk Software GmbH"
tput setaf 5; echo -n "Our Discord: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOnTheLink official Discord server\e]8;;\a'
echo -n "The AnyDesk website: "
echo -e '\e]8;;https://anydesk.com/\aAnyDesk\e]8;;\a'
tput setaf 69; echo "Thank you for using our script!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while installing AnyDesk" && tput sgr0

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#sending positive reaction
echo ";)"

#Restore previous backup?
tput reset
tput clear
tput setaf 3
echo -n "Do you want to restore a backup? (only works if backup was created by the uninstaller script..) (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    # Check for the file local
ls /home/$USER/.anydeskbackup/local/ | grep service.conf > /dev/null

# check output of the previous command
if [ $? -eq 0 ]
then
    tput sgr0
	tput setaf 6
	echo -e "We found the backup for 'local'!, restoring backup...." > /dev/tty
	tput sgr0
    sudo mv /home/$USER/.anydeskbackup/local/service.conf /home/$USER/.anydesk/ > /dev/null
	tput reset
	tput setaf 2
	echo -e "Backup was restored, if you wan't to restore a backup again, please recreate one (this one has been removed from the backup dir and cannot be used as a re-recovery..)" > /dev/tty
	tput sgr0
	sleep 4
else
    echo -e "Backup wasn't local or doesn't exist, checking if this was a system install..."
	sleep 2
	tput reset
	# Check for the file systemwide
ls /home/$USER/.anydeskbackup/system/ | grep service.conf > /dev/null

# check output of the previous command
if [ $? -eq 0 ]
then
    tput sgr0
	tput setaf 6
	echo -e "We found the backup for 'systemwide'!, restoring backup...." > /dev/tty
	tput sgr0
    sudo mv /home/$USER/.anydeskbackup/system/service.conf /etc/anydesk/ > /dev/null
	
	tput reset
	tput setaf 2
	echo -e "Backup was restored, if you wan't to restore a backup again, please recreate one (this one has been removed from the backup dir and cannot be used as a re-recovery..)" > /dev/tty
	tput sgr0
	sleep 4
else
    echo -e "Backup doesn't exist or couldn't be found, if you lost the /home/$USER/.anydeskbackup/ folder then your backup is removed and cannot be recovered..."
	sleep 2
	tput reset
fi
else
    echo "Okay, we won't restore your backup"
fi
fi

# Start the Spinner:
spin &

# Make a note of its Process ID (PID):
SPIN_PID=$!

#Installing/updating
tput setaf 1
echo "Adding GPG-KEY..."
tput setaf 6
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
tput setaf 2
echo "GPG-KEY was added to your device"
sleep 1
tput setaf 1
echo "Adding repository to anydesk-stable.list (located under /etc/apt/sources.list.d/)"
tput setaf 6
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
tput setaf 2
echo "Repository added to anydesk-stable.list"
sleep 2
tput sgr0
sudo apt-get --yes --assume-yes update 2> /dev/null | exec 1> /dev/tty
sudo apt-get --yes --assume-yes install anydesk 2> /dev/null | exec 1> /dev/tty
tput reset
tput setaf 2
tput bold
echo "AnyDesk is now installed on your system!"
tput sgr0

#Creating removal dir
mkdir removal
sudo curl -Lo /home/$USER/anydeskinstaller/removal/anydeskremoval.sh "https://raw.githubusercontent.com/onthelink-nl/scripts/master/AnyDesk%20Unofficial%20Installer%20(Debian)/anydeskremoval.sh"
sudo cp -f anydeskremoval.sh /etc/apt/scripts/anydeskremoval.sh
sudo chmod +x /etc/apt/scripts/anydeskremoval.sh
echo "alias remove-anydesk=/etc/apt/scripts/anydeskremoval.sh" >> /home/$USER/.bashrc
tput setaf 2
echo "Removal script has been installed, please reopen the terminal and use the 'remove-anydesk' command (Without '')"
tput setaf 1
echo "If the .bashrc file is replaced or restored to the original the command will not work, if this is the case please run it using 'sudo bash /etc/apt/scripts/anydeskremoval.sh' (Without '')"
tput sgr0
sleep 5

#stop spinner
kill -9 $SPIN_PID

#Removing local script files
cd -
sudo rm -rf "anydeskinstaller.sh"

#Waiting for user input
read -n 1 -s -r -p "Please read before you exit (press any key to continue)..."

#Quit
tput reset
tput sgr0
tput clear
exit
