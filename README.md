# Scripts
Here you can find all of our scripts we create to make installations easier, we don't create every single thing ourself, we only want to make the installation process super easy and that's why we use other programs in our scripts to achieve this goal

# Before you begin
THIS SCRIPT IS MEANT FOR THE CHROMEBOOKS, IF YOU USE IT ON ANOTHER DEVICE THINGS SHOULD STILL WORK BUT STUFF MAY NOT WORK PROPERLY...

The terminal protection software (TPS) is a minimum protection that only helps if the user doesn't know about the .bashrc file in the home dir of their laptop

The TPS replaces that .bashrc file with a modified one, this will cause the terminal to close automatically
It does say some stuff before it closes but that's just for fun, ofcourse it isn't updating or checking if the user may or may not use the terminal, but it does exit the terminal (even if users try to cancel the .bashrc file using ctrl_c)

The reason why this protection is so minimal is because QGIS is a free to use program and we just simply can't give stuff to "granted" users because that would be changing their project and we just simply do not have the rights to do that, so we won't!


How do i reset this back to normal?
you need to go into your home dir (~/) and edit the hidden file .bashrc.
In the file you need to remove the following lines:

======================================================================================================
#Kill Switch, will be activated when ctrl+c is pressed (Sometimes the chromebooks need to be powerwashed or reset by a recovery to make QGIS work after this)
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        echo "** Nice try!" && exit
}

for i in `seq 1 5`; do
    sleep 1
    echo -n "."
done

tput reset
tput setaf 2; echo "OnTheLink - TERMINAL PROTECTION SOFTWARE"
sleep 1
tput setaf 6; echo "Checking for updates..."
sleep 2
tput setaf 5; echo "No updates found!"
tput setaf 3; echo "Checking terminal protection config file...."
sleep 1
tput setaf 1; echo "You do NOT have the permission to use the terminal! Closing in 4 seconds..."
sleep 1
tput setaf 1; echo "3"
sleep 1
tput setaf 1; echo "2"
sleep 1
tput setaf 1; echo "1"
sleep 1
tput setaf 2; echo "Goodbye!"
sleep 1
exit
======================================================================================================
After removing those lines you can save the file and exit


Still want that better "Terminal Lockdown"?
We are working on our new Terminal Lockdown Script (TLS), it will be available in a few months...

Release Date TLS: ??/??/????

# HOW TO USE:

Open a terminal

Copy and paste this command for the EN version:
sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/OnTheLink_QGIS-MENU_EN.sh && bash "OnTheLink_QGIS-MENU_EN.sh"

Copy and paste this command for the NL version:
sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/OnTheLink_QGIS-MENU_NL.sh && bash "OnTheLink_QGIS-MENU_NL.sh"


Press "Return"
Now you just have to follow the instructions on the screen

# Version History

## QGIS
==========

### **MUFU** - *This is the first working version (This version has no checks for files so this one would require you to choose your options carefully (otherwise you will have to do a manual removal of the things you did wrong, ALWAYS READ EVERYTHING IN THIS VERSION TO NEVER MAKE A MISTAKE!!!)*


# Credits
Creating: Misha Opstal & Leopold Siccama Hiemstra

[Team OnTheLink](https://onthelink.tk/ "Official Website")
