#!/bin/bash
if [[ $EUID -ne 1000 ]]; then
   tput setaf 1
   echo "THIS SCRIPT IS NOT USABLE USING ROOT, TRY WITHOUT USING SUDO"
   sleep 3
   tput reset
   tput clear
   tput sgr0
   exit 1
fi

#INSTALLING REQUIREMENTS
sudo apt install zip unzip dialog 2> /dev/null | exec 1> /dev/tty

#DEFAULT SETTINGS
STARTDIR="$(pwd)"

#Get current user
name="$(logname)"

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

## Start the Spinner:
spin &
## Make a note of its Process ID (PID):
SPIN_PID=$!

#Removing Old Data Dirs
echo BOOTING SCRIPT......
sleep 2
sudo rm -rf /home/$name/QGISSavior

##stop spinner
kill -9 $SPIN_PID

#Reset_TERM
tput reset
tput clear

## Start the Spinner:
spin &

## Make a note of its Process ID (PID):
SPIN_PID=$!

#EMERGANCYPROTOCOL
tput setaf 1
echo INITIATED EMERGENCY BACKUP PROTOCOL..
sleep 2
tput reset
tput clear
tput setaf 1
echo SEARCHING FOR HOST DETAILS..
sleep 3
kill -9 $SPIN_PID
tput reset
tput clear
tput setaf 2
echo WELCOME $name, PLEASE GRAND THE SYSTEM PERMISSION TO COPY THE QGIS FILES ON THE FOLLOWING SCREEN

##Waiting for user response
read -n 1 -s -r -p "[ANY-KEY]"

#Continue Dialog
export NCURSES_NO_UTF8_ACS=1
dialog --title "CONFIRMATION" \
--backtitle "QGIS EMERGENCY COPY PROJECT" \
--ok-label "GRAND PERMISSION" \
--cancel-label "DENY PERMISSION" \
--yesno "IS THE SYSTEM ALLOWED TO COPY?" 0 0

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
      dialog --msgbox "PROTOCOL DEACTIVATED" 5 42
      tput reset
      tput clear
      tput sgr0
      exit
      ;;
   255) 
      tput reset
      tput clear
      dialog --msgbox "[ESC] BUTTON WAS PRESSED, \n PLEASE RESTART THE EMERGENCY PROTOCOL COPY SCRIPT" 6 35
      tput reset
      tput clear
      tput sgr0
      exit 255;;
esac

[ $? == 1 ] && exit 0;
[ $? == 255 ] && exit 0;

tput reset
tput clear
tput setaf 3
echo PERMISSION GRANTED!

## Start the Spinner:
spin &

## Make a note of its Process ID (PID):
SPIN_PID=$!

echo FILE TRANFER IN PROGRESS, KEEP YOUR DEVICE PLUGGED IN AND DO NOT INTERRUPT THIS PROCESS...
sudo mkdir /home/$name/QGISSavior 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/PREFIX/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/PREFIX/PREFIX/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/PREFIX/PREFIX/var/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/PREFIX/PREFIX/var/lib/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/PREFIX/PREFIX/var/lib/flatpak/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/HOMEDIR/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/HOMEDIR/HOMEDIR/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/HOMEDIR/HOMEDIR/.local/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/HOMEDIR/HOMEDIR/.local/share/ 2> /dev/null | exec 1> /dev/tty
sudo mkdir /home/$name/QGISSavior/HOMEDIR/HOMEDIR/.local/share/flatpak/ 2> /dev/null | exec 1> /dev/tty
sudo chmod -R 777 /home/$name/QGISSavior/ 2> /dev/null | exec 1> /dev/tty

sudo cp -a $prefix/var/lib/flatpak/ /home/$name/QGISSavior/PREFIX/PREFIX/var/lib/flatpak/ 2> /dev/null | exec 1> /dev/tty
sudo cp -a $HOME/.local/share/flatpak/ /home/$name/QGISSavior/HOMEDIR/HOMEDIR/.local/share/flatpak/ 2> /dev/null | exec 1> /dev/tty
zip -r /home/$name/QGISSavior/qgis3.6.zip /home/$name/QGISSavior/HOMEDIR /home/$name/QGISSavior/PREFIX 2> /dev/null | exec 1> /dev/tty
sudo rm -rf /home/$name/QGISSavior/PREFIX
sudo rm -rf /home/$name/QGISSavior/HOMEDIR
kill -9 $SPIN_PID
tput reset
tput clear
tput setaf 2
echo THE REQUESTED FILE TRANSFER HAS FINISHED, EXITING IN 3 SECONDS, PLEASE MAIL THE .ZIP FILE LOCATED IN /home/$name/QGISSavior to mishaopstal2004@gmail.com
sleep 3
exit
