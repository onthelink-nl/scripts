#!/bin/bash

#SETTING STARTDIR
STARTDIR="$(pwd)"

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        tput reset && tput clear && tput sgr0 && exit
}

for i in $(seq 1 5); do
    sleep 1
    echo -n "."
done

# Spinner Code
spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in $(seq 0 7)
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 1
    done
  done
}

tput sgr0
tput reset
tput clear

echo "About to start the installer..."
sleep 2
echo "Here we go!!!"
sleep 1

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!
# Kill the spinner on any signal, including our own exit.
trap 'Kill -9 $SPIN_PID' $(seq 0 15)

#Resetting Terminal
tput reset
tput clear
tput sgr0

#Create temp folder
tput setaf 3
echo "Creating temp folder..."
sudo rm -rf /home/"$USER"/wineinstallertemp
sudo mkdir /home/"$USER"/wineinstallertemp
cd /home/"$USER"/wineinstallertemp
tput setaf 2
echo "temp folder created!"

#stop spinner
kill -9 $SPIN_PID

#Reset Terminal Again
tput reset
tput clear
tput sgr0

MACHINE_TYPE=$(uname -m)
if [ "${MACHINE_TYPE}" == 'x86_64' ]; then
  # 64-bit stuff here

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will install Wine on your Linux device (DEBIAN BASED)"
tput bold; echo "We are not the creators of Wine and this is an unofficial script, we do NOT claim wine as our content and all copyrights, trademarks and other intellectual property belong to WineHQ!"
tput setaf 5; echo -n "Our Discord Server: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOTL Discord server\e]8;;\a'
echo -n "The arduino website: "
echo -e '\e]8;;https://www.winehq.org/\aWine\e]8;;\a'
tput setaf 69; echo "Thank you for using our script!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while installing Wine" && tput sgr0
tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue (close terminal to exit, ctrl+c will NOT work)..."

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

#Adding new architecture
tput setaf 1
echo "Adding i386 architecture (for 32bit support in wine) and updating linux..."
sudo dpkg --add-architecture i386
sudo apt-get --yes --assume-yes update 2> /dev/null | exec 1> /dev/tty
sudo apt-get --yes --assume-yes upgrade 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Architecture added and linux is updated!"

#Installing dependencies
tput setaf 1
echo "Installing Dependencies..."
tput setaf 6
sudo apt-get --yes --assume-yes install curl wget apt-utils cron nautilus mono-complete libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libglapi-mesa:i386 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Dependencies are installed!"

#Installing Wine/Winetricks
tput setaf 1
echo "Installing Wine and Winetricks..."
tput setaf 6
sudo apt-get --yes --assume-yes install wine 2> /dev/null | exec 1> /dev/tty
sudo curl -LOs "https://github.com/onthelink-nl/scripts/raw/master/Wine%20Unofficial%20Installer%20(Debian)/winetricks.deb"
sudo apt-get --yes --assume-yes install ./winetricks.deb
tput setaf 2
echo "Wine and Winetricks are installed!"

#Configuring Wine
tput setaf 1
echo "Configuring Wine64..."
sleep 2
tput setaf 6
wine wineboot
tput setaf 2
echo "Wine64 is configured!"
tput setaf 1
echo "Configuring Wine32..."
sleep 2
tput setaf 6
WINEPREFIX="/home/$USER/.wine32" WINEARCH=win32 wine wineboot
tput setaf 2
echo "Wine32 is configured!"
sleep 3

#Reset Terminal Again
tput reset
tput clear
tput sgr0

#Say Wine-BASE is installed
tput setaf 2
echo "Wine 64 and 32 installed!"

#stop spinner
kill -9 $SPIN_PID

#Installing Extra Packages
tput setaf 1
echo "Installing extra packages (32-Bit version because 64 seems unstable, please install 64-Bit packages yourself (you can do this by running: winetricks --gui (or winetricks PACKAGENAME (you probably won’t need sudo))))..."
tput setaf 3
echo "Moving on in 10 seconds…"
sleep 10

#Reset Terminal Again
tput reset
tput clear
tput sgr0

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!

#Setting up wine extra packages
tput setaf 6
WINEPREFIX="/home/$USER/.wine32" WINEARCH=win32 winetricks binkw32 d3dcompiler_47 d3drm d3dx9_36 d3dx9 dinput8 dxdiag dxvk vcrun2017 vb6run vcrun6sp6 vcrun6 xinput dotnet472
sleep 3
tput setaf 2
echo "Extra packages for Wine32 are installed!"

#stop spinner
kill -9 $SPIN_PID

#Telling we are exiting in 5 seconds
tput setaf 3
echo "Exiting in 5 seconds..."
sleep 5

#Removing leftovers
cd "$STARTDIR"
sudo rm -rf /home/"$USER"/wineinstallertemp/
sudo rm -rf /home/"$USER"/wineinstallertemp*
sudo rm -rf /home/"$USER"/wineinstallertemp
sudo rm -rf /home/"$USER"/wineinstaller.sh
sudo rm -rf wineinstaller.sh

#Reset Terminal Again
tput reset
tput clear
tput sgr0

#Exit
cd "$STARTDIR"
exit

else
  # 32-bit stuff here

#NOT SUPPORTED YET (i dont have a 32bit device right now)
tput setaf 3
echo "32-Bit is not supported yet, please come back when we're done..."
sleep 3

#Removing leftovers
cd "$STARTDIR"
sudo rm -rf /home/"$USER"/wineinstallertemp/
sudo rm -rf /home/"$USER"/wineinstallertemp*
sudo rm -rf /home/"$USER"/wineinstallertemp
sudo rm -rf /home/"$USER"/wineinstaller.sh
sudo rm -rf wineinstaller.sh

#Reset Terminal Again
tput reset
tput clear
tput sgr0

#Exit
exit
fi
