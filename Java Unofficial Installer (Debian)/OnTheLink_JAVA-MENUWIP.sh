#!/bin/bash

tput reset
tput clear
selection=
until [ "$selection" = "5" ]; do
tput bold && tput setaf 46; echo "
OnTheLink JAVA-MENU | Version(s): 10.0.2/9.0.4/8u231/7u80 | This MENU and it's SCRIPTS are still in WIP and WILL IN MOST CASES cause issues, please use our stable java menu...
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>>"
tput setaf 191; echo -n "STANDALONE OPTIONS"
tput setaf 45; echo "<<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
1 - Install Java 10.0.2
2 - Install Java 9.0.4
3 - Install Java 8u231
4 - Install Java 7u80
5 - Exit Script normally (RUN THIS ONE IF YOU DON'T WANT TO INSTALL STUFF)
6 - Remove Java from your system (DO NOT ATTEMPT TO DO THIS WHEN A HIGHER VERSION THAN JAVA 11.x.x IS INSTALLED ON YOUR SYSTEM)
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf javainstaller10WIP.sh
		tput setaf 5; echo "Preparing the Java 10.0.2 installation..."
        sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%2010.0.2/javainstaller10WIP.sh"
        sleep 2 ; bash javainstaller10WIP.sh
		sudo rm -rf /home/$USER/javainstaller*
		sudo rm -rf "OnTheLink_JAVA-MENUWIP.sh"
		tput reset
		tput clear
		exit
        ;;
	2 ) 
		sudo rm -rf javainstaller9WIP.sh
		tput setaf 5; echo "Preparing the Java 9.0.4 installation..."
        sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%209.0.4/javainstaller9WIP.sh"
        sleep 2 ; bash javainstaller9WIP.sh
		sudo rm -rf /home/$USER/javainstaller*
		sudo rm -rf "OnTheLink_JAVA-MENUWIP.sh"
		tput reset
		tput clear
		exit
        ;;
	3 ) 
		sudo rm -rf javainstaller8WIP.sh
		tput setaf 5; echo "Preparing the Java 8u231 installation..."
        sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%208u231/javainstaller8WIP.sh"
        sleep 2 ; bash javainstaller8WIP.sh
		sudo rm -rf /home/$USER/javainstaller*
		sudo rm -rf "OnTheLink_JAVA-MENUWIP.sh"
		tput reset
		tput clear
		exit
        ;;
	4 ) 
		sudo rm -rf javainstaller7WIP.sh
		tput setaf 5; echo "Preparing the Java 7u80 installation..."
        sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Java%207u80/javainstaller7WIP.sh"
        sleep 2 ; bash javainstaller7WIP.sh
		sudo rm -rf /home/$USER/javainstaller*
		sudo rm -rf "OnTheLink_JAVA-MENUWIP.sh"
		tput reset
		tput clear
		exit
        ;;
    5 ) 
        sudo rm -rf /home/$USER/javainstaller*
		sudo rm -rf "OnTheLink_JAVA-MENUWIP.sh"
		tput reset
		tput clear
		exit
		;;
    6 ) 
		sudo rm -rf javauninstallerWIP.sh
		tput setaf 5; echo "Preparing Java Removal..."
		sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/Uninstaller/javauninstallerWIP.sh"
		sleep 2 ; bash javauninstallerWIP.sh
		sudo rm -rf /home/$USER/javainstaller*
		sudo rm -rf "OnTheLink_JAVA-MENUWIP.sh"
		tput reset
		tput clear
		exit
		;;
	* ) 
        tput setaf 202; echo "Please enter choice 1, 2, 3, 4, 5, 6..."
		sleep 1 ; tput reset
esac
done
