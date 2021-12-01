# Scripts
Here you can find all of our scripts we create to make installations easier, we don't create every single thing ourself, we only want to make the installation process super easy and that's why we use other programs in our scripts to achieve this goal

# Before you begin

BEFORE YOU CAN USE THE SCRIPTS AT ALL YOU MUST INSTALL CURL AND DIALOG:
`sudo apt-get install curl dialog`

!THE SCRIPTS ARE ALSO STILL IN DEVELOPMENT AND MAY SOMETIMES NOT WORK!

!JAVA BELONGS TO ORACLE AND NOT TO US, AND IF THEY WANT OUR SCRIPT TO VANISH FROM THE INTERNET IT **WILL**... ALL COPYRIGHTS, TRADEMARKS AND OTHER INTELLECTUAL PROPERTIES OF JAVA BELONG TO ORACLE!

# SCRIPTS COMPATIBLE ON ALL LINUX BASED DEVICES
<details>
  <summary>Click to show installers!</summary>
  
  ## - The ARDUINO Installer
  <details>
  <summary>Click to show installer</summary>
<b><h1 align="center">=======================================</h1></b>

<H3 align="center">
We are not responsible for any damage done to your device by using our scripts!!
</H3>

<b><h1 align="center">=======================================</h1></b>

!copyrights, trademarks and other intellectual property belong to Arduino AG!

# HOW TO USE:

1. Open a terminal
2. Choose the script you want to install and paste the command in the terminal
3. Press "Return" (ENTER)
4. Follow the instructions on your screen

<b><h2 align="center">==================================================</h2></b>

<H2 align="center">
ARDUINO INSTALLER
</H2>

<b><h2 align="center">==================================================</h2></b>

# ARDUINO Installation Menu:
<details>
  <summary>Click to show installer</summary>

## ARDUINO INSTALLER WITH VERSION MENU
`sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Arduino%20Unofficial%20Installer%20(LINUX)/OnTheLink_ARDUINO-MENU.sh" && bash OnTheLink_ARDUINO-MENU.sh`
</details>

Or copy and paste one of these commands (Only required when the normal script (above) doesn't work) into the terminal and hit "Return" (ENTER):

# Versions:
<details>
  <summary>Click to show version 1.8.11</summary>

## 1.8.11
`sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Arduino%20Unofficial%20Installer%20(LINUX)/arduino-1.8.11%20(64-32)/arduinoinstaller1.8.11.sh" && bash arduinoinstaller1.8.11.sh`
</details>

# Uninstaller:
Copy and paste this command into the terminal and hit "Return" (ENTER):
`https://github.com/onthelink-nl/scripts/raw/master/Arduino%20Unofficial%20Installer%20(LINUX)/Uninstallers/UNINSTALL-MENU.sh" && bash UNINSTALL-MENU.sh`

<b><h3 align="center">========================================================================</h3></b>

  </details>
</details>

# SCRIPTS COMPATIBLE ON ALL DEBIAN BASED DEVICES
<details>
  <summary>Click to show installers!</summary>
  
  ## - The Wine Installer
  <details>
  <summary>Click to show installer</summary>
<b><h1 align="center">=======================================</h1></b>

<H3 align="center">
We are not responsible for any damage done to your device by using our scripts!!
</H3>

<b><h1 align="center">=======================================</h1></b>

!copyrights, trademarks and other intellectual property belong to WineHQ!

# HOW TO USE:

1. Open a terminal
2. Choose the script you want to install and paste the command in the terminal
3. Press "Return" (ENTER)
4. Follow the instructions on your screen

<b><h2 align="center">==================================================</h2></b>

<H2 align="center">
WINE INSTALLER
</H2>

<b><h2 align="center">==================================================</h2></b>

## READ BEFORE USING!!! (VERY IMPORTANT)
### IF SOMETHING ASKS YOU TO RESTART, PRESS RESTART LATER!!
_*IF THERE ARE NO FILES IN THERE OR YOU ARE NOT RUNNING CHROME OS THEN THIS ISN'T NECESSARY*_
BEFORE RUNNING THIS WINE INSTALLER DO THE FOLLOWING THINGS:  
Do: `cd /etc/apt/sources.list.d/`  
Do: `ls` (For checking if any files are in there (There might be multiple files, please apply the following steps to all of them to be absolutely sure you got the right one (If there are none then you can skip the whole *READ BEFORE USING*)))  
Do: `sudo vim cros.list` (or whatever it is called on your chromebook or linux device)  
Press *i* to enter editor mode  
Change this: `deb https://storage.googleapis.com/cros-packages/80 buster main` (this might be different but it doesn’t really matter)  
To this: `deb [trusted=yes] https://storage.googleapis.com/cros-packages/80 buster main`  
Press *esc* button  
Type: *:w* and press enter (yes you need to do the : before the w)  
Type: *:q* and press enter (yes you need to do the : before the q)  
Do: `cd -` (to return to the directory you was before doing this)

# WINE Installation Menu:
<details>
  <summary>Click to show installer</summary>

## WINE INSTALLER WITH MENU
`sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Wine%20Unofficial%20Installer%20(Debian)/OnTheLink_WINE-MENU.sh" && bash OnTheLink_WINE-MENU.sh`<br>
</details>

Or copy and paste the following command(s) (Only required when the normal script (above) doesn't work) into the terminal and hit "Return" (ENTER):<br>

# Versions:
<details>
  <summary>Click to show version WINE</summary>

## WINE
`sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Wine%20Unofficial%20Installer%20(Debian)/Wine/wineinstaller.sh" && bash wineinstaller.sh`<br>
</details>

# How to run programs after installation:
AFTER INSTALLING WINE USING THIS SCRIPT RUN THIS TO EXECUTE IN 32BIT:<br>
`WINEPREFIX="/home/$USER/.wine32" WINEARCH=win32 wine some_program` (e.g. explorer.exe)<br>
FOR WINETRICKS:<br>
`WINEPREFIX="/home/$USER/.wine32" WINEARCH=win32 winetricks` (so for winetricks no wine before *winetricks*)<br>

AND THIS FOR 64BIT:<br>
`wine some_program` (e.g. explorer.exe)<br>
FOR WINETRICKS:<br>
`winetricks` (so for winetricks no wine before *winetricks*)<br>
<br>
*Your wine64 prefix (so also the files of it’s drive) are located in /home/$USER/.wine*<br>
*Your wine32 prefix (so also the files of it’s drive) are located in /home/$USER/.wine32*<br>
_YOU MUST ENABLE HIDDEN FOLDERS TO LOCATE THE DRIVE IN YOUR FILE MANAGER..._<br>
<br>
# Uninstaller:
Copy and paste this command into the terminal and hit "Return" (ENTER):<br>
`https://github.com/onthelink-nl/scripts/raw/master/Wine%20Unofficial%20Installer%20(Debian)/UNINSTALLER/wineuninstaller.sh" && bash wineuninstaller.sh`<br>

<b><h3 align="center">========================================================================</h3></b>

  </details>
  
  ## - Apache2 + MySQL + PHP + Pterodactyl Installer
  <details>
  <summary>Click to show installer</summary>
<b><h1 align="center">=======================================</h1></b>

<H3 align="center">
We are not responsible for any damage done to your device by using our scripts!!
</H3>

<b><h1 align="center">=======================================</h1></b>

<h3 align="center">!copyrights, trademarks and other intellectual property belong to Apache and MySQL!</h3>
<h3 align="center">Pterodactyl software is MIT Licensed | Copyright © 2015 - 2021 Dane Everitt & Contributors.</h3>

# HOW TO USE:

1. Open a terminal
2. Copy the command below and paste it in the terminal
3. Press "Return" (ENTER)
4. Follow the instructions on your screen

<b><h2 align="center">==================================================</h2></b>

<H2 align="center">
Web-Pterodactyl INSTALLER (WSL2 Compatible)
</H2>

<b><h2 align="center">==================================================</h2></b>

# Install script:
<details>
  <summary>Click to show installer</summary>

## Apache2 + MySQL + PHP + Pterodactyl INSTALLER WITH VERSION MENU
`cd && sudo curl -LOs "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Web%20and%20Pterodactyl%20Unofficial%20Installer%20(Debian)/WebPteroq_Debian_T-U20.04.sh" && sudo bash WebPteroq_Debian_T-U20.04.sh`
</details>
<b><h1 align="center">=======================================</h1></b>
</details>

  ## - The Java Installer
  <details>
  <summary>Click to show installer</summary>
<b><h1 align="center">=======================================</h1></b>

<H3 align="center">
We are not responsible for any damage done to your device by using our scripts!!
</H3>

<b><h1 align="center">=======================================</h1></b>

!copyrights, trademarks and other intellectual property belong to the Oracle Corporation!

# HOW TO USE:

1. Open a terminal
2. Choose the script you want to install and paste the command in the terminal
3. Press "Return" (ENTER)
4. Follow the instructions on your screen

<b><h2 align="center">==================================================</h2></b>

<H2 align="center">
Java INSTALLER
</H2>

<b><h2 align="center">==================================================</h2></b>

# Java Installation Menu:
<details>
  <summary>Click to show installer</summary>

## JAVA INSTALLER WITH VERSION MENU
`sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/OnTheLink_JAVA-MENU.sh" && bash OnTheLink_JAVA-MENU.sh`
</details>

Or copy and paste one of these commands (Only required when the normal script (above) doesn't work) into the terminal and hit "Return" (ENTER):

# Versions:
<details>
  <summary>Click to show version 10.0.2</summary>

## 10.0.2
`sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%2010.0.2/javainstaller10.sh" && bash javainstaller10.sh`
</details>
<details>
  <summary>Click to show version 9.0.4</summary>

## 9.0.4
`sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%209.0.4/javainstaller9.sh" && bash javainstaller9.sh`
</details>
<details>
  <summary>Click to show version 8u241</summary>
  
## 8u241
`sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%208u241/javainstaller8.sh" && bash javainstaller8.sh`
</details>
<details>
  <summary>Click to show version 7u80</summary>

## 7u80
`sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%207u80/javainstaller7.sh" && bash javainstaller7.sh`
</details>

# Uninstaller:
Copy and paste this command into the terminal and hit "Return" (ENTER):
`sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Uninstaller/javauninstaller.sh" && bash javauninstaller.sh`

<b><h3 align="center">========================================================================</h3></b>

  </details>
  
  ## - The AnyDesk Installer (Doesn't seem to work on chromebooks)
  <details>
  <summary>Click to show installer</summary>
<b><h1 align="center">=======================================</h1></b>

<H3 align="center">
We are not responsible for any damage done to your device by using our scripts!!
</H3>

<b><h1 align="center">=======================================</h1></b>


# HOW TO USE:

1. Open a terminal
2. Choose the script you want to install and paste the command in the terminal
3. Press "Return" (ENTER)
4. Follow the instructions on your screen

<b><h2 align="center">==================================================</h2></b>

<H2 align="center">
ANYDESK INSTALLER
</H2>

<b><h2 align="center">==================================================</h2></b>

Copy and paste this command into the terminal and hit "Return" (ENTER):
`sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/AnyDesk%20Unofficial%20Installer%20(Debian)/anydeskinstaller.sh" && bash anydeskinstaller.sh`

<b><h3 align="center">========================================================================</h3></b>

  </details>
</details>
</details>

# SCRIPTS ONLY COMPATIBLE WITH CHROMEBOOKS (ONLY CHROMEBOOKTESTED INCLUDED)
<details>
  <summary>Click to show installers!</summary>
  
## - The QGIS Installer
<details>
  <summary>Click to show installer</summary>
<b><h1 align="center">=======================================</h1></b>

<H3 align="center">
We are not responsible for any damage done to your device by using our scripts!!
</H3>

<b><h1 align="center">=======================================</h1></b>

<b><h2 align="center">==================================================</h2></b>

<H4 align="center">
The following section is only for the QGIS-MENU
</H4>

<b><h2 align="center">==================================================</h2></b>

The terminal protection software (TPS) is a minimum protection that only helps if the user doesn't know about the .bashrc file in his home directory of his Chromebook (Please do not install the TPS on a chromebook that you do not own, we are not responsible for anything when and if you do this)


The TPS replaces that .bashrc file with a modified one, this will cause the terminal to close automatically
It does say some stuff before it closes but that's just for fun, ofcourse it isn't updating or checking if the user may or may not use the terminal, but it does exit the terminal (even if users try to cancel the .bashrc file using ctrl_c)

The reason why this protection is so minimal is because QGIS is a free to use program and we just simply cannot give stuff to "granted" users because that would be changing their project and we just simply do not have the rights to do that, so we won't!

How to restore the .bashrc file? -BUSTER-
Run the main script and select the option that says it will remove stuff (2), now press restore settings.
It will now be restored to the default file, if you still want to use qgis you need to go to the main menu in the script and select the auto updater option (7) and the copy option (4). Now everything is ready to go!

How to restore the .bashrc file? -STRETCH-
Please follow this tutorial to restore the .bashrc file manually:

[Restore .bashrc file](https://raw.githubusercontent.com/onthelink-nl/scripts/master/MUFU/qgis/MUFU/Tutorials/HowToRestoreBashrcFile.txt "Tutorial to restore .bashrc file")


Still want that better "Terminal Lockdown"?
We are working on our new Terminal Lockdown Script (TLS), it will be available in a few ??????...

Release Date TLS: ??/??/????

# HOW TO USE:

1. Open a terminal
2. Choose the script you want to install and paste the command in the terminal
3. Press "Return" (ENTER)
4. Follow the instructions on your screen

<b><h2 align="center">==================================================</h2></b>

<H2 align="center">
QGIS INSTALLER
</H2>

<b><h2 align="center">==================================================</h2></b>

Copy and paste this command for the EN version:<br>
`sudo curl -LO https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_EN.sh && bash "OnTheLink_QGIS-MENU_EN.sh"`

Copy and paste this command for the NL version:<br>
`sudo curl -LO https://github.com/onthelink-nl/scripts/raw/master/OnTheLink_QGIS-MENU_NL.sh && bash "OnTheLink_QGIS-MENU_NL.sh"`

<b><h3 align="center">========================================================================</h3></b>

WE ALSO HAVE CREATED A COMPLETE INSTRUCTIONS PDF WITH MORE DETAILS ABOUT THE QGIS INSTALLATION ####
[OPEN INSTRUCTIONS EVA](https://github.com/onthelink-nl/scripts/blob/master/EVA/qgis/EVA/Tutorials/INSTRUCTIONS/QGIS%20Instructions.pdf "INSTRUCTIONS PDF FILE")<br>
[OPEN INSTRUCTIONS MUFU](https://github.com/onthelink-nl/scripts/blob/master/MUFU/qgis/MUFU/Tutorials/INSTRUCTIONS/QGIS%20Instructions.pdf "INSTRUCTIONS PDF FILE")

</details>
</details>

# Version History
<details>
  <summary>Arduino</summary>

## Arduino
==========

### **1.8.11** - *WIP INSTALLER OF ARDUINO 1.8.11, If you find out that something is wrong about the installer please report it in an issue...*
</details>

<details>
  <summary>WebPteroq</summary>

## Web + Pterodactyl
==========

### **0.1.1** - *ALPHA INSTALLER OF APACHE + MYSQL + PHP + PTERODACTYL (AND WINGS), The script can currently install Apache2, MySQL-server, PHP8.0, Pterodactyl and Wings. It also configures them according to your choices, it has the possibility to install a brand new MySQL server to configure but it can also use an existing one (That includes external ones). After it's done with the basic configuration (Allowing ports, setting directory's and a FQDN) it will continue to install and configure wings where you will have to enter the token given inside the (in that part of the script) already working pterodactyl webserver. Later versions of the script will include more flexible options, better detections for if statements and more customization for your packages such as creating additional databases from within the script, creating additional Apache virtualhosts and possibly in the future also the option to select nginx instead of apache. The script is also compatible in the latest ubuntu package of WSL2 (We do recommend to not use the impish distribution since it caused troubles at our end when testing. We've tested and can confirm the script does work in Ubuntu 20.04 (And in the WSL2 Ubuntu version 20.04))
</details>

<details>
  <summary>Java</summary>

## Java
==========

### **10.0.2** - *STABLE INSTALLER OF JAVA 10.0.2, If you find out that something is wrong about the installer please report it in an issue...*
### **9.0.4** - *STABLE INSTALLER OF JAVA 9.0.4, If you find out that something is wrong about the installer please report it in an issue...*
### **8u241** - *STABLE INSTALLER OF JAVA 8u241, If you find out that something is wrong about the installer please report it in an issue...*
### **7u80** - *STABLE INSTALLER OF JAVA 7u80, If you find out that something is wrong about the installer please report it in an issue...*
</details>
<details>
  <summary>QGIS</summary>
  
## QGIS
==========

### **EVA** - *_The "Extended Validation Access" update contains many things that has improved literally everything in the script, the QGIS script will now have debian 9 and 10 support and the menu's have been optimized. It now has an updater which will keep your installation up to date with your debian version (if your debian was updated from 9 to 10 it would remove the old configuration and replace it with the new one for 10, this also works the other way around...) and it will only update if you are connected to the internet so it won't be writing an empty file as the updater Crontab's are now much more practical as we no longer remove the crontab on installing our version of the crontab, we now only add and/or remove the required line from the crontab._*

<br>

### **MUFU** - *_This is the first working main-version (This version has no checks for files but it should try to get rid of any unnecessary files when reïnstalling or updating QGIS (so it'll just try to remove unnecessary things (if those things even exist on your chromebook ofcourse... (Don't forget that this version is for the most part stable but there could be bugs hiding in the dark, if you find any, please report them to us as soon as possible!!!)))_*
</details>
<details>
  <summary>AnyDesk</summary>

## AnyDesk
==========

### **DEBIAN** - *STABLE INSTALLER OF ANYDESK, If you find out that something is wrong about the installer please report it in an issue...*
</details>

# Troubleshooting
<details>
  <summary>Q: Crosh/Terminal can't be found</summary>

A: [Install this chrome extension](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo/related/ "Secure Shell App")
</details>

# Credits
Creating: Misha Opstal, Eva Looijestein & Leopold Siccama Hiemstra  
Special thanks to: [Dalton Voorburg](https://www.daltonvoorburg.nl/ "Scholengemeenschap Dalton Voorburg")

WARNING: WE DO NOT OWN THE SOFTWARE THAT WE CREATE THE INSTALLERS FOR, ALL COPYRIGHTS GO TO THE CREATORS OF THE SOFTWARE AND WE DO *NOT* CLAIM IT AS OURS!

Tools used: [Flatpak](https://flatpak.org/ "The Future Of Apps On Linux")


Software: [QGIS](https://qgis.org/en/site/ "A Free and Open Source Geographic Information System") | [AnyDesk](https://anydesk.com/ "Remote Desktop Software - AnyWhere. AnyTime. AnyDesk") | [Java](https://www.oracle.com/java/ "Java Software - Oracle") | [Arduino](https://www.arduino.cc/ "Arduino - Home")
