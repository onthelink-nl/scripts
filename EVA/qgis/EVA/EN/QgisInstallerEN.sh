#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   tput setaf 1
   echo "This script has to be run with root permissions (sudo works best)"
   sleep 3
   tput reset
   tput clear
   tput sgr0
   exit 1
fi

#Get current user
name="$(logname)"

#Get current path (Required for completion removal of install files)
STARTDIR="$(pwd)"

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

echo "Starting the installation script..."
sleep 2
echo "There we go!!!"
sleep 1

## Start the Spinner:
spin &
## Make a note of its Process ID (PID):
SPIN_PID=$!

##CLEARING TERMINAL
tput reset
tput clear

##REMOVING OLDER VERSIONS
tput bold && tput setaf 5; echo "Removing older versions..."
tput setaf 6
sudo flatpak uninstall --force-remove org.qgis.qgis
sudo flatpak remote-delete --force org.qgis.qgis-origin
sudo flatpak remote-delete --force org.qgis.qgis-1-origin
sudo flatpak remote-delete --force org.qgis.qgis-2-origin
sudo flatpak remote-delete --force org.qgis.qgis-3-origin
sudo flatpak remote-delete --force org.qgis.qgis-4-origin
sudo flatpak remote-delete --force org.qgis.qgis-5-origin
sudo flatpak remote-delete --force org.qgis.qgis-6-origin
sudo flatpak remote-delete --force org.qgis.qgis-7-origin
sudo flatpak remote-delete --force org.qgis.qgis-8-origin
sudo flatpak remote-delete --force org.qgis.qgis-9-origin
sudo flatpak remote-delete --force org.qgis.qgis-10-origin
sudo flatpak remote-delete --force flathub
sudo flatpak remote-delete --force flathub-1
sudo flatpak remote-delete --force flathub-2
sudo flatpak remote-delete --force flathub-3
sudo flatpak remote-delete --force flathub-4
sudo flatpak remote-delete --force flathub-5
sudo flatpak remote-delete --force flathub-6
sudo flatpak remote-delete --force flathub-7
sudo flatpak remote-delete --force flathub-8
sudo flatpak remote-delete --force flathub-9
sudo flatpak remote-delete --force flathub-10
sudo flatpak uninstall --force-remove org.kde.Platform
sudo flatpak uninstall --force-remove org.freedesktop.Platform.html5-codecs
sudo flatpak uninstall --unused
chattr -i /run/user/1000/doc/by-app/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
chattr -i /home/"$name"/org.qgis.qgis/ 2> /dev/null | exec 1> /dev/tty
sudo mv "/run/user/1000/doc/*" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/run/user/1000/doc" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/run/user/1000/flatpak-monitor/*" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/run/user/1000/flatpak-monitor" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/run/user/1000/app/*" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/run/user/1000/app" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/home/$name/org.qgis.qgis/*" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/home/$name/org.qgis.qgis" /tmp 2> /dev/null | exec 1> /dev/tty
sudo rm -rf "/home/$name/.var/app/org.qgis.qgis" 2> /dev/null | exec 1> /dev/tty
sudo rm -rf "/home/$name/.var/app/org.kde.Platform" 2> /dev/null | exec 1> /dev/tty
sudo rm -rf "/home/$name/.var/app/org.freedesktop.Platform.html5-codecs" 2> /dev/null | exec 1> /dev/tty
sudo mv "/home/$name/.var/app/org.qgis.qgis" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/home/$name/.var/app/org.kde.Platform" /tmp 2> /dev/null | exec 1> /dev/tty
sudo mv "/home/$name/.var/app/org.freedesktop.Platform.html5-codecs" /tmp 2> /dev/null | exec 1> /dev/tty

##stop spinner
kill -9 $SPIN_PID

#Reset_TERM
tput reset
tput clear

MACHINE_VERSION=`cat /etc/debian_version`
case $MACHINE_VERSION in
9|9.1|9.2|9.3|9.4|9.5|9.6|9.7|9.8|9.9)
   # Stretch stuff here

##STRETCH CHECK COMPLETED
tput setaf 2
echo "STRETCH FOUND!"
sleep 2
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list

##Initializing Script
tput reset
tput clear

##Information about the creators and the script itself
tput setaf 2; echo The script is originally created by Misha Opstal, Eva Looijestein and Leopold Siccama Hiemstra.
echo "This script will install QGIS (STRETCH) on your chromebook."
echo Flatpak is being used for the most important part of the installation!
tput bold; echo We are not the creators of QGIS or Flatpak and this is an unofficial script.
tput setaf 5; echo -n "Our website: "
echo -e '\e]8;;https://onthelink.nl\aOnTheLink\e]8;;\a'
echo -n "The Flatpak website: "
echo -e '\e]8;;https://flatpak.org\aFlatpak\e]8;;\a'
echo -n "The QGIS website: "
echo -e '\e]8;;https://qgis.org\aQGIS\e]8;;\a'
tput setaf 69; echo Thank you for using our script!
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We advise you to always have a stable internetconnection when using the script and never press ctrl+c during the installation... (When you do this there is a chance that you will have to reset the chromebook using powerwash or a recovery)" && tput sgr0
tput sgr0
tput setaf 3

##Waiting for user response
read -n 1 -s -r -p "[ANY-KEY]"

##sending positive reaction
echo "!"
tput reset
tput clear

#Continue Dialog
export NCURSES_NO_UTF8_ACS=1
dialog --title "Confirm" \
--backtitle "QGIS Installation - Created by OnTheLink" \
--ok-label "Continue" \
--cancel-label "Cancel" \
--yesno "Do you want to continue?" 0 0

# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
case $response in
   0) 
      ;;
   1) 
      tput reset
      tput clear
      dialog --msgbox "Installation was aborted by "$name"" 5 42
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput reset
      tput clear
      dialog --msgbox "[ESC] Button has been pressed, \nInstallation will be aborted" 6 35
      tput reset
      tput clear
      tput sgr0
      exit 255;;
esac

[ $? == 1 ] && exit 0;
[ $? == 255 ] && exit 0;

## Start the Spinner:
spin &

## Make a note of its Process ID (PID):
SPIN_PID=$!

#MESSAGES
COLUMNS=$(tput cols)
echoa="Installation of QGIS has started:"
echob="Creating temporary folder"
echoba="Temporary folder has been created!"
echoc="Installing dependencies"
echoca="Dependencies have been installed!"
echod="Installing Flatpak"
echoda="Flatpak has been installed!"
echoe="Refreshing apt"
echoea="apt refreshed!"
echof="Installing QGIS"
echoz=""

##Commands after any-keyz
tput sgr0
sudo apt-get --yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 5
printf "%*s\n" $(((${#echoa}+$COLUMNS)/2)) "$echoa"
tput setaf 9
printf "%*s\n" $(((${#echob}+$COLUMNS)/2)) "$echob"
sudo rm -rf /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
mkdir /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
cd /home/"$name"/qgisfiles
tput sgr0
tput setaf 2
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echoba"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echoc}+$COLUMNS)/2)) "$echoc"
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/OTL_QGIS_STRETCH.list
sudo cp -f OTL_QGIS_STRETCH.list /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list
sudo chmod +x /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list
sudo rm -rf "OTL_QGIS_STRETCH.list"
sudo apt-get --yes --assume-yes install wget apt-utils nautilus inotify-tools cron 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoca}+$COLUMNS)/2)) "$echoca"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echod}+$COLUMNS)/2)) "$echod"
tput sgr0
sudo apt-get -t stretch-backports --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoda}+$COLUMNS)/2)) "$echoda"
tput setaf 9
printf "%*s\n" $(((${#echoe}+$COLUMNS)/2)) "$echoe"
tput sgr0
sudo apt-get --yes --assume-yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoea}+$COLUMNS)/2)) "$echoea"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echof}+$COLUMNS)/2)) "$echof"
tput sgr0
sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty
sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/qgis.flatpakref 2> /dev/null | exec 1> /dev/tty
kill -9 $SPIN_PID
tput reset
tput clear
flatpak -y install qgis.flatpakref
tput reset
tput clear
tput bold
tput setaf 5
echo "QGIS has been installed!!!"
sleep 1
tput sgr0
tput setaf 1
echo "Exiting script in 10 seconds..."
sleep 5
tput setaf 1
echo "5"
sleep 1
tput setaf 1
echo "4"
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
echo "Goodbye!"
sleep 1
cd $STARTDIR
sudo rm -rf /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
sudo rm -rf QgisInstallerEN.sh 2> /dev/null | exec 1> /dev/tty
tput reset
tput clear
tput sgr0
exit
;;
10|10.1|10.2|10.3|10.4|10.5|10.6|10.7|10.8|10.9)
   ## Buster stuff here

##BUSTER CHECK COMPLETED
tput setaf 2
echo "BUSTER FOUND!"
sleep 2
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo rm -rf /etc/apt/sources.list.d/OTL_QGIS_STRETCH.list

##Initializing Script
tput reset
tput clear

##Information about the creators and the script itself
tput setaf 2; echo The script is originally created by Misha Opstal, Eva Looijestein and Leopold Siccama Hiemstra.
echo "This script will install QGIS (BUSTER) on your chromebook."
echo Flatpak is being used for the most important part of the installation!
tput bold; echo We are not the creators of QGIS or Flatpak and this is an unofficial script.
tput setaf 5; echo -n "Our website: "
echo -e '\e]8;;https://onthelink.nl\aOnTheLink\e]8;;\a'
echo -n "The Flatpak website: "
echo -e '\e]8;;https://flatpak.org\aFlatpak\e]8;;\a'
echo -n "The QGIS website: "
echo -e '\e]8;;https://qgis.org\aQGIS\e]8;;\a'
tput setaf 69; echo Thank you for using our script!
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We advise you to always have a stable internetconnection when using the script and never press ctrl+c during the installation... (When you do this there is a chance that you will have to reset the chromebook using powerwash or a recovery)"
tput sgr0
tput setaf 3

##Waiting for user response
read -n 1 -s -r -p "[ANY-KEY]"

##sending positive reaction
echo "!"
tput reset
tput clear

#Continue Dialog
export NCURSES_NO_UTF8_ACS=1
dialog --title "Confirm" \
--backtitle "QGIS Installation - Created by OnTheLink" \
--ok-label "Continue" \
--cancel-label "Cancel" \
--yesno "Do you want to continue?" 0 0

# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
case $response in
   0) 
      ;;
   1) 
      tput reset
      tput clear
      dialog --msgbox "Installation was aborted by "$name"" 5 42
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput reset
      tput clear
      dialog --msgbox "[ESC] Button has been pressed, \nInstallation will be aborted" 6 35
      tput reset
      tput clear
      tput sgr0
      exit 255;;
esac

[ $? == 1 ] && exit;
[ $? == 255 ] && exit;

## Start the Spinner:
spin &

## Make a note of its Process ID (PID):
SPIN_PID=$!

#MESSAGES
COLUMNS=$(tput cols)
echoa="Installation of QGIS has started:"
echob="Creating temporary folder"
echoba="Temporary folder has been created!"
echoc="Installing dependencies"
echoca="Dependencies have been installed!"
echod="Installing Flatpak"
echoda="Flatpak has been installed!"
echoe="Refreshing apt"
echoea="apt refreshed!"
echof="Installing QGIS"
echoz=""

##Command's after any-key
tput sgr0
sudo apt-get --yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 5
printf "%*s\n" $(((${#echoa}+$COLUMNS)/2)) "$echoa"
tput setaf 9
printf "%*s\n" $(((${#echob}+$COLUMNS)/2)) "$echob"
sudo rm -rf /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
mkdir /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
cd /home/"$name"/qgisfiles
tput sgr0
tput setaf 2
printf "%*s\n" $(((${#echoba}+$COLUMNS)/2)) "$echoba"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echoc}+$COLUMNS)/2)) "$echoc"
tput sgr0
sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/OTL_QGIS_BUSTER.list
sudo cp -f OTL_QGIS_BUSTER.list /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo chmod +x /etc/apt/sources.list.d/OTL_QGIS_BUSTER.list
sudo rm -rf "OTL_QGIS_BUSTER.list"
sudo apt-get --yes --assume-yes install wget apt-utils nautilus rsync grsync inotify-tools cron 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoca}+$COLUMNS)/2)) "$echoca"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echod}+$COLUMNS)/2)) "$echod"
tput sgr0
sudo apt-get -t buster-backports --yes --assume-yes install flatpak 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoda}+$COLUMNS)/2)) "$echoda"
tput setaf 9
printf "%*s\n" $(((${#echoe}+$COLUMNS)/2)) "$echoe"
tput sgr0
sudo apt-get --yes --assume-yes update 2> /dev/null | exec 1> /dev/tty
tput setaf 2
printf "%*s\n" $(((${#echoea}+$COLUMNS)/2)) "$echoea"
tput sgr0
tput setaf 9
printf "%*s\n" $(((${#echof}+$COLUMNS)/2)) "$echof"
tput sgr0
sudo apt-get --yes --assume-yes install gnome-software-plugin-flatpak 2> /dev/null | exec 1> /dev/tty
sudo wget -q --no-check-certificate https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/qgis.flatpakref 2> /dev/null | exec 1> /dev/tty
kill -9 $SPIN_PID
tput reset
tput clear
flatpak -y install qgis.flatpakref
tput reset
tput clear
tput bold
tput setaf 5
echo "QGIS has been installed!!!"
sleep 1
tput sgr0
tput setaf 1
echo "Exiting script in 10 seconds..."
sleep 5
tput setaf 1
echo "5"
sleep 1
tput setaf 1
echo "4"
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
echo "Goodbye!"
sleep 1
cd $STARTDIR
sudo rm -rf /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
sudo rm -rf QgisInstallerEN.sh 2> /dev/null | exec 1> /dev/tty
tput reset
tput clear
tput sgr0
exit
;;
*)
## FAILSAFE
  tput setaf 3
  echo "Stretch and Buster cannot be found, your debian version is not supported yet..."
  sleep 1
  tput setaf 1
  echo "4"
  sleep 1
  tput setaf 1
  echo "3"
  sleep 1
  tput setaf 1
  echo "2"
  sleep 1
  tput setaf 1
  echo "1"
  cd $STARTDIR
  sudo rm -rf /home/"$name"/qgisfiles 2> /dev/null | exec 1> /dev/tty
  sudo rm -rf QgisInstallerEN.sh 2> /dev/null | exec 1> /dev/tty
  tput reset
  tput clear
  tput sgr0
  exit
;;
esac
