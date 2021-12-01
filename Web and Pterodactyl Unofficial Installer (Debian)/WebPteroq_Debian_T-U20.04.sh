#!/bin/bash


#  $$\      $$\                 $$\                 $$\                       
#  $$$\    $$$ |                $$ |                $$ |                      
#  $$$$\  $$$$ | $$$$$$\   $$$$$$$ | $$$$$$\        $$$$$$$\  $$\   $$\       
#  $$\$$\$$ $$ | \____$$\ $$  __$$ |$$  __$$\       $$  __$$\ $$ |  $$ |      
#  $$ \$$$  $$ | $$$$$$$ |$$ /  $$ |$$$$$$$$ |      $$ |  $$ |$$ |  $$ |      
#  $$ |\$  /$$ |$$  __$$ |$$ |  $$ |$$   ____|      $$ |  $$ |$$ |  $$ |      
#  $$ | \_/ $$ |\$$$$$$$ |\$$$$$$$ |\$$$$$$$\       $$$$$$$  |\$$$$$$$ |      
#  \__|     \__| \_______| \_______| \_______|      \_______/  \____$$ |      
#                                                             $$\   $$ |      
#                                                             \$$$$$$  |      
#                                                              \______/       
#  $$\      $$\ $$\           $$\                        $$$$$$\                        $$\               $$\ 
#  $$$\    $$$ |\__|          $$ |                      $$  __$$\                       $$ |              $$ |
#  $$$$\  $$$$ |$$\  $$$$$$$\ $$$$$$$\   $$$$$$\        $$ /  $$ | $$$$$$\   $$$$$$$\ $$$$$$\    $$$$$$\  $$ |
#  $$\$$\$$ $$ |$$ |$$  _____|$$  __$$\  \____$$\       $$ |  $$ |$$  __$$\ $$  _____|\_$$  _|   \____$$\ $$ |
#  $$ \$$$  $$ |$$ |\$$$$$$\  $$ |  $$ | $$$$$$$ |      $$ |  $$ |$$ /  $$ |\$$$$$$\    $$ |     $$$$$$$ |$$ |
#  $$ |\$  /$$ |$$ | \____$$\ $$ |  $$ |$$  __$$ |      $$ |  $$ |$$ |  $$ | \____$$\   $$ |$$\ $$  __$$ |$$ |
#  $$ | \_/ $$ |$$ |$$$$$$$  |$$ |  $$ |\$$$$$$$ |       $$$$$$  |$$$$$$$  |$$$$$$$  |  \$$$$  |\$$$$$$$ |$$ |
#  \__|     \__|\__|\_______/ \__|  \__| \_______|       \______/ $$  ____/ \_______/    \____/  \_______|\__|
#                                                                 $$ |                                        
#                                                                 $$ |                                        
#                                                                 \__|                                        

# Pterodactyl software is MIT Licensed | Copyright © 2015 - 2021 Dane Everitt & Contributors.

# Get current user
name="$(logname)"

# Get current path
STARTDIR="$(pwd)"

# Clear the terminal
tput reset
tput clear

# Setting color codes
error="tput setaf 1"
succeeded="tput setaf 2"
info="tput setaf 3"
log="tput setaf 5"
ask="tput setaf 6"

# Create TEMP Folder
mkdir /home/"$name"/tmp-webpteroqinstaller
cd /home/"$name"/tmp-webpteroqinstaller || exit

## WSL Detection
function interop_prefix {
	win_location="/mnt/"
	if [ -f /etc/wsl.conf ]; then
		tmp="$(awk -F '=' '/root/ {print $2}' /etc/wsl.conf | awk '{$1=$1;print}')"
		[ "$tmp" == "" ] || win_location="$tmp"
		unset tmp
	fi
	echo "$win_location"

	unset win_location
}

function sysdrive_prefix {
	win_location="$(interop_prefix)"
	hard_reset=0
	for pt in $(ls "$win_location"); do
		if [ $(echo "$pt" | wc -l) -eq 1 ]; then
			if [ -d "$win_location$pt/Windows/System32" ]; then
				hard_reset=1
				win_location="$pt"
				break
			fi
		fi 
	done

	if [ $hard_reset -eq 0 ]; then
		win_location="c"
	fi

	echo "$win_location"

	unset win_location
	unset hard_reset
}



tput reset
tput clear
if [[ $(grep Microsoft /proc/version) ]];
then
	$info
	echo "██╗    ██╗███████╗██╗     ██╗    ██████╗ ███████╗████████╗███████╗ ██████╗████████╗███████╗██████╗ "
	echo "██║    ██║██╔════╝██║    ███║    ██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗"
	echo "██║ █╗ ██║███████╗██║    ╚██║    ██║  ██║█████╗     ██║   █████╗  ██║        ██║   █████╗  ██║  ██║"
	echo "██║███╗██║╚════██║██║     ██║    ██║  ██║██╔══╝     ██║   ██╔══╝  ██║        ██║   ██╔══╝  ██║  ██║"
	echo "╚███╔███╔╝███████║███████╗██║    ██████╔╝███████╗   ██║   ███████╗╚██████╗   ██║   ███████╗██████╔╝"
	echo " ╚══╝╚══╝ ╚══════╝╚══════╝╚═╝    ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝ ╚═════╝   ╚═╝   ╚══════╝╚═════╝ "
	echo
	echo "WSL1 is currently unsupported since there is no workaround to get systemd working"
	echo "Please update to WSL2 to be able to run the installer (https://docs.microsoft.com/en-us/windows/wsl/install)"
	$error
	echo
	echo "Aborting..."
	$log
	sleep 3
	tput sgr0
	tput reset
	tput clear
	exit
fi
if [[ $(grep microsoft /proc/version) ]]
then
	$info
	echo "██╗    ██╗███████╗██╗     ██████╗     ██████╗ ███████╗████████╗███████╗ ██████╗████████╗███████╗██████╗ "
	echo "██║    ██║██╔════╝██║     ╚════██╗    ██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗"
	echo "██║ █╗ ██║███████╗██║      █████╔╝    ██║  ██║█████╗     ██║   █████╗  ██║        ██║   █████╗  ██║  ██║"
	echo "██║███╗██║╚════██║██║     ██╔═══╝     ██║  ██║██╔══╝     ██║   ██╔══╝  ██║        ██║   ██╔══╝  ██║  ██║"
	echo "╚███╔███╔╝███████║███████╗███████╗    ██████╔╝███████╗   ██║   ███████╗╚██████╗   ██║   ███████╗██████╔╝"
	echo " ╚══╝╚══╝ ╚══════╝╚══════╝╚══════╝    ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝ ╚═════╝   ╚═╝   ╚══════╝╚═════╝ "
    echo
    echo "The script will now try to install the necassery components to run systemd"
    echo "Checking if this has already been done before by the script..."
    echo
    echo
    echo

    WSLcheck=/etc/wsl2exists.conf
    if [ -f "$WSLcheck" ];
    then
        $succeeded
        echo "Systemd is already installed and enabled on this device!"
        $log
    else 
        $info
        echo "The systemd compatibility script hasn't been run yet"
        echo "Running ubuntu-wsl2-systemd-script..."
        $log
        sudo apt-get -y install git 2> /dev/null | exec 1> /dev/tty
        git clone https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git 2> /dev/null | exec 1> /dev/tty
        cd ubuntu-wsl2-systemd-script/ || exit
        sudo bash ubuntu-wsl2-systemd-script.sh --force
        echo "WSL2_Systemd: Installed" | sudo tee -a /etc/wsl2exists.conf 2> /dev/null | exec 1> /dev/tty
        $info
        echo "The systemd component for WSL2 has succesfully been installed and enabled!"
        echo "We will now reboot WSL2 to apply the new settings"
        echo "Please run this script again when WSL2 has restarted."
        sleep 10
        $log
        tput reset
        tput clear
        tput sgr0
        history -a
        "$(interop_prefix)$(sysdrive_prefix)"/Windows/System32/cmd.exe /C wsl --shutdown
    fi
fi

# Refreshing apt & Installing Dependencies
PHP="/etc/apt/sources.list.d/ondrej-ubuntu-php-*"
REDIS="/etc/apt/sources.list.d/chris-lea-ubuntu-redis-server-*"
MARIADB="/etc/apt/sources.list.d/mariadb.list"

$info
echo "Refreshing apt for up-to-date packages..."
$log
sudo apt-get -y update 2> /dev/null | exec 1> /dev/tty
$info
echo "Installing dependencies"
$log
sudo apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg tar unzip git redis-server 2> /dev/null | exec 1> /dev/tty

if [ 0 -lt $(ls $PHP 2>/dev/null | wc -w) ];
then
	$succeeded
	echo "The PHP repository had already been added!"
	$log
else
	sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y 2> /dev/null | exec 1> /dev/tty
fi

if [ 0 -lt $(ls $REDIS 2>/dev/null | wc -w) ];
then
	$succeeded
	echo "The redis-server repository had already been added!"
	$log
else
	sudo add-apt-repository ppa:chris-lea/redis-server -y 2> /dev/null | exec 1> /dev/tty
fi

if [ 0 -lt $(ls $MARIADB 2>/dev/null | wc -w) ];
then
	$succeeded
	echo "The MariaDB repository had already been added!"
	$log
else
	curl -LOs "https://downloads.mariadb.com/MariaDB/mariadb_repo_setup"
	sudo bash mariadb_repo_setup
fi

sleep 5
sudo apt-get -y update 2> /dev/null | exec 1> /dev/tty
sudo apt-add-repository universe -y 2> /dev/null | exec 1> /dev/tty
$succeeded
echo "Dependencies have been installed!"
sleep 7


### Webserver Install

# LAMP
MySQL_Question="unanswered"
$info
while [[ $MySQL_Question != "answered" ]]
do
	tput reset
	tput clear
	$ask
	echo "Please answer the following"
	read -p "Do you already have a MySQL server installed and configured? " MySQL_Configured
	if [[ $MySQL_Configured == "Y" || $MySQL_Configured == "y" ]];
	then
		$ask
		echo "You have already installed and set-up a MySQL server"
		read -p "Is this correct? " MySQL_Confirm
		if [[ $MySQL_Confirm == "Y" || $MySQL_Confirm == "y" ]];
		then
			MySQL_Question="answered"
		fi
		if [[ $MySQL_Confirm == "N" || $MySQL_Confirm == "n" ]];
		then
			MySQL_Question="unanswered"
		fi
	fi

	if [[ $MySQL_Configured == "N" || $MySQL_Configured == "n" ]];
	then
		$ask
		echo "You don't have a MySQL server already installed and set-up"
		read -p "Is this correct? " MySQL_Confirm
		if [[ $MySQL_Confirm == "Y" || $MySQL_Confirm == "y" ]];
		then
			MySQL_Question="answered"
		fi
		if [[ $MySQL_Confirm == "N" || $MySQL_Confirm == "n" ]];
		then
			MySQL_Question="unanswered"
		fi
	fi
done
$info
echo
echo
echo

if [[ $MySQL_Configured == "Y" || $MySQL_Configured == "y" ]];
then
	echo "We will now start installing LAMP (Apache2 + PHP8.0)"
	$log
	sudo apt-get -y install apache2 libapache2-mod-php certbot python3-certbot-apache php8.0 php8.0-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} 2> /dev/null | exec 1> /dev/tty
	sudo ufw allow "Apache Full" 2> /dev/null | exec 1> /dev/tty
	sudo chmod 777 /etc/apache2/apache2.conf
fi

if [[ $MySQL_Configured == "N" || $MySQL_Configured == "n" ]];
then
	echo "We will now start installing LAMP (Apache2 + Mysql-server + PHP8.0)"
	$log
	sudo rm -rf /usr/share/mysql-common/
	sudo mkdir -p /usr/share/mysql-common/
	sudo chmod 777 /usr/share/mysql-common/
	sudo chmod -R 777 /usr/share/mysql-common/
	echo "#Nothing" | sudo tee /usr/share/mysql-common/configure-symlinks
	sudo chmod 777 /usr/share/mysql-common/configure-symlinks
	sudo apt-get -y install apache2 libapache2-mod-php certbot python3-certbot-apache mysql-server php8.0 php8.0-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} 2> /dev/null | exec 1> /dev/tty
	sudo ufw allow "Apache Full" 2> /dev/null | exec 1> /dev/tty
	sudo chmod 777 /etc/apache2/apache2.conf
	sudo chmod 777 /usr/share/mysql-common/
	sudo chmod 777 /usr/share/mysql-common/configure-symlinks
fi

$succeeded
echo "LAMP has been installed!"
$log
sleep 7


### Pterodactyl Install

# Composer
tput reset
tput clear
cd /home/"$name"/tmp-webpteroqinstaller || exit
sudo curl -LOs "https://getcomposer.org/installer"
sudo php installer --install-dir=/usr/local/bin --filename=composer

## var/www/pterodactyl location

# Variables
slash="/"
novarwww="Tip: Don't forget to add /var/www/ to the path you're entering!"
noslash="Tip: Don't forget to add / at the begin of the path you're entering!"
notvalid="Tip: The chosen directory must already exist!"

while [ "$wwwvalid" != "yes" ]
do
	pass1="invalid"
	pass2="invalid"
	pass3="invalid"
	$ask
	echo "$wwwvalid"
	echo "If left empty this will default to /var/www/"
	read -p "Please enter a full valid path for /var/www/ (e.g. /var/www/ or /media/drive2/var/www/) " wwwlocation
	SUB='/var/www/'

	if [[ $wwwlocation == "" ]];
	then
		wwwlocation="/var/www/"
	fi

	if [[ $wwwlocation != */ ]];
	then
		usedlocation="$wwwlocation$slash"
	else
		usedlocation="$wwwlocation"
	fi

	if [[ "$usedlocation" == *"$SUB"* ]];
	then
		$succeeded
		pass1="valid"
		pass1debug="valid"
		$log
	else
		$error
		echo "The directory either doesn't exist or isn't a valid /var/www/ path."
		echo "$novarwww"
		endtip="$novarwww"
		pass1="invalid"
		pass1debug="invalid"
		$log
		sleep 2
		tput reset
		tput clear
		$log
	fi

	if [[ "$pass1" == "valid" ]];
	then
		if [[ $usedlocation == /* ]];
		then
			$succeeded
			pass2="valid"
			pass2debug="valid"
			$log
		else
			$error
			echo "The directory either doesn't exist or isn't a valid /var/www/ path."
			echo "$noslash"
			endtip="$noslash"
			pass2="invalid"
			pass2debug="invalid"
			$log
			sleep 2
			tput reset
			tput clear
		fi
	else
		if [[ $usedlocation == /* ]];
		then
			$succeeded
			pass2="valid"
			pass2debug="valid"
			$log
		else
			pass2debug="invalid"
		fi
		$log
	fi
	
	if [[ "$pass2" == "valid" ]];
	then
		if [[ -d "$usedlocation" ]];
		then
			$succeeded
			pass3="valid"
			pass3debug="valid"
			$log
		else
			$error
			echo "The directory either doesn't exist or isn't a valid /var/www/ path."
			echo "$notvalid"
			endtip="$notvalid"
			pass3="invalid"
			pass3debug="invalid"
			wwwvalid="pass3"
			$log
			sleep 2
			tput reset
			tput clear
		fi
	else
		if [[ -d "$usedlocation" ]];
		then
			$succeeded
			pass3="valid"
			pass3debug="valid"
			$log
		else
			pass3debug="invalid"
		fi
		$log
	fi

	if [[ "$pass1" == "valid" && $pass2 == "valid" && $pass3 == "valid" ]];
	then
		$info
		echo "Chosen directory: $usedlocation"
		read -p "Is this correct? " -n 1 -r
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			$succeeded
			wwwvalid=yes
			sleep 2
			tput reset
			tput clear
			$log
		else
			$error
			wwwvalid="Pick another directory..."
			sleep 2
			tput reset
			tput clear
			$info
		fi
	else
		$error
		echo
		echo "The directory either doesn't exist or isn't a valid /var/www/ path."
		echo "$endtip"
		echo
		echo "You've entered: $usedlocation"
		echo
		echo "Current state of error: $wwwvalid"
		echo "Passes:"
		echo "Pass1 (contains /var/www/): $pass1debug"
		echo "Pass2 (contains / before the path): $pass2debug"
		echo "Pass3 (directory exists): $pass3debug"
		$log
		sleep 1
	fi
done


$log
sudo mkdir -p "$usedlocation"/pterodactyl
cd "$usedlocation"/pterodactyl || exit
sudo curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
sudo tar -xzvf panel.tar.gz
sudo chmod -R 755 storage/* bootstrap/cache/
sudo rm -rf panel.tar.gz

## MySQL Database Configuration

if [[ $MySQL_Configured == "N" || $MySQL_Configured == "n" ]];
then
	sudo chmod 777 /usr/share/mysql-common/
	sudo chmod 777 /usr/share/mysql-common/configure-symlinks
fi

# LOGIN INFO
if [[ $MySQL_Configured == "Y" || $MySQL_Configured == "y" ]];
then
	$ask
	read -p "Enter the remote server host (e.g. mysql.example.com / 192.168.1.2 / localhost / 127.0.0.1): " DBSERVERHOST
	$log
	DBHOST="%"
	DBPANELUSER="pterodactyl"
	DBPANELGUEST="pterodactyluser"
	DBPASS="$(openssl rand -base64 12)"
	DBGUESTPASS="$(openssl rand -base64 12)"
	$ask
	read -p "Enter your root MySQL account password (Used to login with 'sudo mysql -u root -p password', please verify before entering..): " DBROOTPASS
	$log
	DB="panel"

	pteroqguestpass="/home/$name/pterodactyl_db_guestpass.txt"
	pteroqpass="/home/$name/pterodactyl_db_pass.txt"

	if [[ -e $pteroqpass || -L $pteroqpass ]] ; then
	    i=0
	    while [[ -e $pteroqpass-$i || -L $pteroqpass-$i ]] ; do
	        let i++
	    done
	    pteroqpass=$pteroqpass-$i
	fi

	if [[ -e $pteroqguestpass || -L $pteroqguestpass ]] ; then
	    i=0
	    while [[ -e $pteroqguestpass-$i || -L $pteroqguestpass-$i ]] ; do
	        let i++
	    done
	    pteroqguestpass=$pteroqguestpass-$i
	fi

	echo "$DBPASS" > $pteroqpass
	DBUSEDPASS="$(cat $pteroqpass)"
	echo "$DBGUESTPASS" > $pteroqguestpass
	DBUSEDGUESTPASS="$(cat $pteroqguestpass)"

	sudo /etc/init.d/mysql start
	sudo systemctl restart mysql

	$log

	# Creating Pterodactyl Data
	sudo mysql -uroot -h"${DBSERVERHOST}" -p"${DBROOTPASS}" -e "CREATE DATABASE ${DB};" 2> /dev/null | exec 1> /dev/tty
	sudo mysql -uroot -h"${DBSERVERHOST}" -p"${DBROOTPASS}" -e "CREATE USER '${DBPANELUSER}'@'${DBHOST}' IDENTIFIED BY '${DBUSEDPASS}';" 2> /dev/null | exec 1> /dev/tty
	sudo mysql -uroot -h"${DBSERVERHOST}" -p"${DBROOTPASS}" -e "CREATE USER '${DBPANELGUEST}'@'${DBHOST}' IDENTIFIED BY '${DBUSEDGUESTPASS}';" 2> /dev/null | exec 1> /dev/tty
	sudo mysql -uroot -h"${DBSERVERHOST}" -p"${DBROOTPASS}" -e "ALTER USER '${DBPANELGUEST}'@'${DBHOST}' IDENTIFIED BY '${DBUSEDGUESTPASS}';" 2> /dev/null | exec 1> /dev/tty
	sudo mysql -uroot -h"${DBSERVERHOST}" -p"${DBROOTPASS}" -e "ALTER USER '${DBPANELUSER}'@'${DBHOST}' IDENTIFIED BY '${DBUSEDPASS}';" 2> /dev/null | exec 1> /dev/tty
	sudo mysql -uroot -h"${DBSERVERHOST}" -p"${DBROOTPASS}" -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${DBPANELUSER}'@'${DBHOST}' WITH GRANT OPTION;" 2> /dev/null | exec 1> /dev/tty
	sudo mysql -uroot -h"${DBSERVERHOST}" -p"${DBROOTPASS}" -e "GRANT ALL PRIVILEGES ON *.* TO '${DBPANELGUEST}'@'${DBHOST}' WITH GRANT OPTION;" 2> /dev/null | exec 1> /dev/tty
	sudo mysql -uroot -h"${DBSERVERHOST}" -p"${DBROOTPASS}" -e "FLUSH PRIVILEGES;" 2> /dev/null | exec 1> /dev/tty
fi

if [[ $MySQL_Configured == "N" || $MySQL_Configured == "n" ]];
then
	DBHOST="127.0.0.1"
	DBPANELUSER="pterodactyl"
	DBPANELGUEST="pterodactyluser"
	DBPASS="$(openssl rand -base64 12)"
	DBGUESTPASS="$(openssl rand -base64 12)"
	DBROOTPASS="$(openssl rand -base64 12)"
	DB="panel"

	pteroqpass="/home/$name/pterodactyl_db_pass.txt"
	pteroqguestpass="/home/$name/pterodactyl_db_guestpass.txt"
	pteroqrootpass="/home/$name/pterodactyl_db_rootpass.txt"

	if [[ -e $pteroqpass || -L $pteroqpass ]] ; then
	    i=0
	    while [[ -e $pteroqpass-$i || -L $pteroqpass-$i ]] ; do
	        let i++
	    done
	    pteroqpass=$pteroqpass-$i
	fi

	if [[ -e $pteroqrootpass || -L $pteroqrootpass ]] ; then
	    i=0
	    while [[ -e $pteroqrootpass-$i || -L $pteroqrootpass-$i ]] ; do
	        let i++
	    done
	    pteroqrootpass=$pteroqrootpass-$i
	fi

	if [[ -e $pteroqguestpass || -L $pteroqguestpass ]] ; then
	    i=0
	    while [[ -e $pteroqguestpass-$i || -L $pteroqguestpass-$i ]] ; do
	        let i++
	    done
	    pteroqguestpass=$pteroqguestpass-$i
	fi

	echo "$DBPASS" > $pteroqpass
	DBUSEDPASS="$(cat $pteroqpass)"
	echo "$DBROOTPASS" > $pteroqrootpass
	DBUSEDROOTPASS="$(cat $pteroqrootpass)"
	echo "$DBGUESTPASS" > $pteroqguestpass
	DBUSEDGUESTPASS="$(cat $pteroqguestpass)"

	sudo ufw allow 3306 2> /dev/null | exec 1> /dev/tty
	sudo curl -LOs "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Web%20and%20Pterodactyl%20Unofficial%20Installer%20(Debian)/my.cnf"
	sudo rm -rf /etc/mysql/my.cnf
	sudo cp my.cnf /etc/mysql/my.cnf
	sudo rm -rf /var/lib/mysql/
	sudo rm -rf /var/lib/mysql-files/
	sudo rm -rf /var/log/mysql/
	sudo rm -rf /var/run/mysqld/
	sudo mkdir -p /var/lib/mysql/
	sudo mkdir -p /var/lib/mysql-files/
	sudo mkdir -p /var/log/mysql/
	sudo chown -R mysql:mysql /var/log/mysql/
	sudo chown -R mysql:mysql /var/lib/mysql-files/
	sudo chown -R mysql:mysql /var/lib/mysql/
	sudo mysqld --initialize
	sudo /etc/init.d/mysql start
	sudo systemctl restart mysql
	sudo /etc/init.d/mysql stop
	sudo rm -rf /var/run/mysqld/
	sudo mkdir -p /var/run/mysqld/
	sudo chown mysql:mysql /var/run/mysqld/
	sleep 2
	sudo mysqld_safe --skip-grant-tables --skip-networking &
	sleep 5
	sudo mysql -uroot -e "FLUSH PRIVILEGES;ALTER USER 'root'@'localhost' IDENTIFIED BY '${DBUSEDROOTPASS}';FLUSH PRIVILEGES;CREATE DATABASE ${DB};CREATE USER '${DBPANELUSER}'@'${DBHOST}' IDENTIFIED BY '${DBUSEDPASS}';GRANT ALL PRIVILEGES ON ${DB}.* TO '${DBPANELUSER}'@'${DBHOST}' WITH GRANT OPTION;CREATE USER '${DBPANELGUEST}'@'${DBHOST}' IDENTIFIED BY '${DBUSEDGUESTPASS}';GRANT ALL PRIVILEGES ON *.* TO '${DBPANELGUEST}'@'${DBHOST}' WITH GRANT OPTION;FLUSH PRIVILEGES;"
	sudo /etc/init.d/mysql stop 2> /dev/null | exec 1> /dev/tty
	sudo killall -KILL mysql mysqld_safe mysqld 2> /dev/null | exec 1> /dev/tty
	sudo /etc/init.d/mysql start
	sudo systemctl restart mysql
	echo ${DBUSEDROOTPASS}
	$log
fi

if [[ $MySQL_Configured == "N" || $MySQL_Configured == "n" ]];
then
	sudo chmod 777 /usr/share/mysql-common/
	sudo chmod 777 /usr/share/mysql-common/configure-symlinks
fi

# WARNING ABOUT PASSWORD
consent="no"
while [[ $consent != "yes" ]]
do
	tput reset
	tput clear
	$error
	echo $typo
	$info
	echo "MySQL has been configured and we have generated a random password for the login's"
	echo "The passwords have been stored in your home directory"
	echo "Navigate there in a new terminal (if on a non gui system use CTRL + ALT + F2)"
	echo
	echo "Find the file pterodactyl_db_pass.txt and open it using 'cat filename'"
	echo "Now write it down or keep this terminal open because you will need it again soon!"
	echo "Tip: If on non gui system you could do CTRL + ALT + F1(Or F2) to move between the two terminals"
	echo
	echo
	$ask
	read -p "Type 'I know the password' to continue: " doYou
	$log
	if [[ $doYou == "I know the password" ]];
	then
		consent="yes"
		typo=""
	else
		consent="no"
		typo="It appears you've made a typo!"
	fi
done


# Environment
sudo cp .env.example .env
sudo composer install --no-dev --optimize-autoloader
php artisan key:generate --force
sudo mkdir /home/"$name"/important_env_backup
sudo cp .env /home/"$name"/important_env_backup/.env

tryagainstate="goback"
trysetup="yes"
trydb="yes"
trymail="yes"
happy="n"
while [[ $tryagainstate != "continue" ]];
do
	if [[ $trysetup != "no" ]];
	then
		php artisan p:environment:setup
		$ask
		echo "You've just configured the environment setup"
		read -p "Do you want to continue with the settings you chose?: " happy
		if [[ $happy == "y" ]];
		then
			trysetup="no"
		else
			trysetup="yes"
		fi
	fi

	if [[ $trydb != "no" ]];
	then
		php artisan p:environment:database
		$ask
		echo "You've just configured the environment database"
		read -p "Do you want to continue with the settings you chose?: " happy
		if [[ $happy == "y" ]];
		then
			trydb="no"
		else
			trydb="yes"
		fi
	fi

	if [[ $trymail != "no" ]];
	then
		php artisan p:environment:mail
		$ask
		echo "You've just configured the environment mail"
		read -p "Do you want to continue with the settings you chose?: " happy
		if [[ $happy == "y" ]];
		then
			trymail="no"
		else
			trymail="yes"
		fi
	fi

	if [[ $trysetup == "no" && $trydb == "no" && $trymail == "no" ]];
	then
		tryagainstate="continue"
	else
		tryagainstate="goback"
	fi
done
	
php artisan migrate --seed --force
php artisan p:user:make

# Permissions
sudo chown -R www-data:www-data "$usedlocation"/pterodactyl/

# Crontab Configuration
artisan="pterodactyl/artisan"
crontab -l | { cat; echo "* * * * * php $usedlocation$artisan schedule:run >> /dev/null 2>&1"; } | crontab -

# Queue Worker
curl -LOs "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Web%20and%20Pterodactyl%20Unofficial%20Installer%20(Debian)/pteroq.service"
sudo cp pteroq.service /etc/systemd/system/pteroq.service
sudo systemctl enable --now redis-server
sudo systemctl enable --now pteroq.service

### Pterodactyl Webserver Configuration

sudo ufw allow 2022
sudo ufw allow 8080
if [[ $(grep microsoft /proc/version) ]];
then
	$info
	echo "ufw will not be enabled since you are running WSL2"
	echo "You can safely ignore this message"
	sleep 7
	$log
else
	$log
	sudo ufw enable
fi

if [[ $MySQL_Configured == "N" || $MySQL_Configured == "n" ]];
then
	sudo chmod 777 /usr/share/mysql-common/
	sudo chmod 777 /usr/share/mysql-common/configure-symlinks
fi

# Default
cd /etc/apache2/sites-available || exit
tput reset
tput clear

while [[ "$PWCdone" != "valid" ]];
do
	$info
	echo "$PWCdone"
	$ask
	echo "Available methods: Use SSL (1) / Don't use SSL (2)"
	read -p "Which one would you like to use? " SSLMODE
	echo
	$log

	PWCdone="Invalid option"
	validdomain="invalid"

		if [[ "$SSLMODE" == 1 ]];
		then
			$log
			## SSL Method
			sudo curl -LOs "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Web%20and%20Pterodactyl%20Unofficial%20Installer%20(Debian)/ssl/pterodactyl.conf"

			# Assign the filename
			filename="pterodactyl.conf"
			filename2="/etc/apache2/apache2.conf"
			public="pterodactyl/public"

			# Define searches
			search="<domain>"
			search2="<folder>"

			# Define replaces
			replace2="$usedlocation$public"

			while [[ "$validdomain" != "valid" ]];
			do
				# Let user define the domain
				$info
				echo "Make sure that your FQDN points to this server or else the installation will fail!"
				echo "You can do this by checking the DNS records if behind a proxy like cloudflare or if not by using 'ping FQDN'"
				echo
				echo
				echo "If you want to use the installation locally use localhost instead of 127.0.0.1"
				echo "This only applies to the FQDN and the MySQL database should (in case it's installed locally) still be configured using 127.0.0.1 to prevent issues with pterodactyl"
				$ask
				read -p "Please enter a valid FQDN: " replace
				$log

				if [[ "$replace" == "localhost" || "$replace" == "*.aaa" || "$replace" == "*.aarp" || "$replace" == "*.abarth" || "$replace" == "*.abb" || "$replace" == "*.abbott" || "$replace" == "*.abbvie" || "$replace" == "*.abc" || "$replace" == "*.able" || "$replace" == "*.abogado" || "$replace" == "*.abudhabi" || "$replace" == "*.ac" || "$replace" == "*.academy" || "$replace" == "*.accenture" || "$replace" == "*.accountant" || "$replace" == "*.accountants" || "$replace" == "*.aco" || "$replace" == "*.active" || "$replace" == "*.actor" || "$replace" == "*.ad" || "$replace" == "*.adac" || "$replace" == "*.ads" || "$replace" == "*.adult" || "$replace" == "*.ae" || "$replace" == "*.aeg" || "$replace" == "*.aero" || "$replace" == "*.aetna" || "$replace" == "*.af" || "$replace" == "*.afamilycompany" || "$replace" == "*.afl" || "$replace" == "*.africa" || "$replace" == "*.ag" || "$replace" == "*.agakhan" || "$replace" == "*.agency" || "$replace" == "*.ai" || "$replace" == "*.aig" || "$replace" == "*.aigo" || "$replace" == "*.airbus" || "$replace" == "*.airforce" || "$replace" == "*.airtel" || "$replace" == "*.akdn" || "$replace" == "*.al" || "$replace" == "*.alfaromeo" || "$replace" == "*.alibaba" || "$replace" == "*.alipay" || "$replace" == "*.allfinanz" || "$replace" == "*.allstate" || "$replace" == "*.ally" || "$replace" == "*.alsace" || "$replace" == "*.alstom" || "$replace" == "*.am" || "$replace" == "*.amazon" || "$replace" == "*.americanexpress" || "$replace" == "*.americanfamily" || "$replace" == "*.amex" || "$replace" == "*.amfam" || "$replace" == "*.amica" || "$replace" == "*.amsterdam" || "$replace" == "*.an" || "$replace" == "*.analytics" || "$replace" == "*.android" || "$replace" == "*.anquan" || "$replace" == "*.anz" || "$replace" == "*.ao" || "$replace" == "*.aol" || "$replace" == "*.apartments" || "$replace" == "*.app" || "$replace" == "*.apple" || "$replace" == "*.aq" || "$replace" == "*.aquarelle" || "$replace" == "*.ar" || "$replace" == "*.arab" || "$replace" == "*.aramco" || "$replace" == "*.archi" || "$replace" == "*.army" || "$replace" == "*.arpa" || "$replace" == "*.art" || "$replace" == "*.arte" || "$replace" == "*.as" || "$replace" == "*.asda" || "$replace" == "*.asia" || "$replace" == "*.associates" || "$replace" == "*.at" || "$replace" == "*.athleta" || "$replace" == "*.attorney" || "$replace" == "*.au" || "$replace" == "*.auction" || "$replace" == "*.audi" || "$replace" == "*.audible" || "$replace" == "*.audio" || "$replace" == "*.auspost" || "$replace" == "*.author" || "$replace" == "*.auto" || "$replace" == "*.autos" || "$replace" == "*.avianca" || "$replace" == "*.aw" || "$replace" == "*.aws" || "$replace" == "*.ax" || "$replace" == "*.axa" || "$replace" == "*.az" || "$replace" == "*.azure" || "$replace" == "*.ba" || "$replace" == "*.baby" || "$replace" == "*.baidu" || "$replace" == "*.banamex" || "$replace" == "*.bananarepublic" || "$replace" == "*.band" || "$replace" == "*.bank" || "$replace" == "*.bar" || "$replace" == "*.barcelona" || "$replace" == "*.barclaycard" || "$replace" == "*.barclays" || "$replace" == "*.barefoot" || "$replace" == "*.bargains" || "$replace" == "*.baseball" || "$replace" == "*.basketball" || "$replace" == "*.bauhaus" || "$replace" == "*.bayern" || "$replace" == "*.bb" || "$replace" == "*.bbc" || "$replace" == "*.bbt" || "$replace" == "*.bbva" || "$replace" == "*.bcg" || "$replace" == "*.bcn" || "$replace" == "*.bd" || "$replace" == "*.be" || "$replace" == "*.beats" || "$replace" == "*.beauty" || "$replace" == "*.beer" || "$replace" == "*.bentley" || "$replace" == "*.berlin" || "$replace" == "*.best" || "$replace" == "*.bestbuy" || "$replace" == "*.bet" || "$replace" == "*.bf" || "$replace" == "*.bg" || "$replace" == "*.bh" || "$replace" == "*.bharti" || "$replace" == "*.bi" || "$replace" == "*.bible" || "$replace" == "*.bid" || "$replace" == "*.bike" || "$replace" == "*.bing" || "$replace" == "*.bingo" || "$replace" == "*.bio" || "$replace" == "*.biz" || "$replace" == "*.bj" || "$replace" == "*.bl" || "$replace" == "*.black" || "$replace" == "*.blackfriday" || "$replace" == "*.blanco" || "$replace" == "*.blockbuster" || "$replace" == "*.blog" || "$replace" == "*.bloomberg" || "$replace" == "*.blue" || "$replace" == "*.bm" || "$replace" == "*.bms" || "$replace" == "*.bmw" || "$replace" == "*.bn" || "$replace" == "*.bnl" || "$replace" == "*.bnpparibas" || "$replace" == "*.bo" || "$replace" == "*.boats" || "$replace" == "*.boehringer" || "$replace" == "*.bofa" || "$replace" == "*.bom" || "$replace" == "*.bond" || "$replace" == "*.boo" || "$replace" == "*.book" || "$replace" == "*.booking" || "$replace" == "*.boots" || "$replace" == "*.bosch" || "$replace" == "*.bostik" || "$replace" == "*.boston" || "$replace" == "*.bot" || "$replace" == "*.boutique" || "$replace" == "*.box" || "$replace" == "*.bq" || "$replace" == "*.br" || "$replace" == "*.bradesco" || "$replace" == "*.bridgestone" || "$replace" == "*.broadway" || "$replace" == "*.broker" || "$replace" == "*.brother" || "$replace" == "*.brussels" || "$replace" == "*.bs" || "$replace" == "*.bt" || "$replace" == "*.budapest" || "$replace" == "*.bugatti" || "$replace" == "*.build" || "$replace" == "*.builders" || "$replace" == "*.business" || "$replace" == "*.buy" || "$replace" == "*.buzz" || "$replace" == "*.bv" || "$replace" == "*.bw" || "$replace" == "*.by" || "$replace" == "*.bz" || "$replace" == "*.bzh" || "$replace" == "*.ca" || "$replace" == "*.cab" || "$replace" == "*.cafe" || "$replace" == "*.cal" || "$replace" == "*.call" || "$replace" == "*.calvinklein" || "$replace" == "*.cam" || "$replace" == "*.camera" || "$replace" == "*.camp" || "$replace" == "*.cancerresearch" || "$replace" == "*.canon" || "$replace" == "*.capetown" || "$replace" == "*.capital" || "$replace" == "*.capitalone" || "$replace" == "*.car" || "$replace" == "*.caravan" || "$replace" == "*.cards" || "$replace" == "*.care" || "$replace" == "*.career" || "$replace" == "*.careers" || "$replace" == "*.cars" || "$replace" == "*.cartier" || "$replace" == "*.casa" || "$replace" == "*.case" || "$replace" == "*.caseih" || "$replace" == "*.cash" || "$replace" == "*.casino" || "$replace" == "*.cat" || "$replace" == "*.catering" || "$replace" == "*.catholic" || "$replace" == "*.cba" || "$replace" == "*.cbn" || "$replace" == "*.cbre" || "$replace" == "*.cbs" || "$replace" == "*.cc" || "$replace" == "*.cd" || "$replace" == "*.ceb" || "$replace" == "*.center" || "$replace" == "*.ceo" || "$replace" == "*.cern" || "$replace" == "*.cf" || "$replace" == "*.cfa" || "$replace" == "*.cfd" || "$replace" == "*.cg" || "$replace" == "*.ch" || "$replace" == "*.chanel" || "$replace" == "*.channel" || "$replace" == "*.charity" || "$replace" == "*.chase" || "$replace" == "*.chat" || "$replace" == "*.cheap" || "$replace" == "*.chintai" || "$replace" == "*.chloe" || "$replace" == "*.christmas" || "$replace" == "*.chrome" || "$replace" == "*.chrysler" || "$replace" == "*.church" || "$replace" == "*.ci" || "$replace" == "*.cipriani" || "$replace" == "*.circle" || "$replace" == "*.cisco" || "$replace" == "*.citadel" || "$replace" == "*.citi" || "$replace" == "*.citic" || "$replace" == "*.city" || "$replace" == "*.cityeats" || "$replace" == "*.ck" || "$replace" == "*.cl" || "$replace" == "*.claims" || "$replace" == "*.cleaning" || "$replace" == "*.click" || "$replace" == "*.clinic" || "$replace" == "*.clinique" || "$replace" == "*.clothing" || "$replace" == "*.cloud" || "$replace" == "*.club" || "$replace" == "*.clubmed" || "$replace" == "*.cm" || "$replace" == "*.cn" || "$replace" == "*.co" || "$replace" == "*.coach" || "$replace" == "*.codes" || "$replace" == "*.coffee" || "$replace" == "*.college" || "$replace" == "*.cologne" || "$replace" == "*.com" || "$replace" == "*.comcast" || "$replace" == "*.commbank" || "$replace" == "*.community" || "$replace" == "*.company" || "$replace" == "*.compare" || "$replace" == "*.computer" || "$replace" == "*.comsec" || "$replace" == "*.condos" || "$replace" == "*.construction" || "$replace" == "*.consulting" || "$replace" == "*.contact" || "$replace" == "*.contractors" || "$replace" == "*.cooking" || "$replace" == "*.cookingchannel" || "$replace" == "*.cool" || "$replace" == "*.coop" || "$replace" == "*.corsica" || "$replace" == "*.country" || "$replace" == "*.coupon" || "$replace" == "*.coupons" || "$replace" == "*.courses" || "$replace" == "*.cpa" || "$replace" == "*.cr" || "$replace" == "*.credit" || "$replace" == "*.creditcard" || "$replace" == "*.creditunion" || "$replace" == "*.cricket" || "$replace" == "*.crown" || "$replace" == "*.crs" || "$replace" == "*.cruise" || "$replace" == "*.cruises" || "$replace" == "*.csc" || "$replace" == "*.cu" || "$replace" == "*.cuisinella" || "$replace" == "*.cv" || "$replace" == "*.cw" || "$replace" == "*.cx" || "$replace" == "*.cy" || "$replace" == "*.cymru" || "$replace" == "*.cyou" || "$replace" == "*.cz" || "$replace" == "*.dabur" || "$replace" == "*.dad" || "$replace" == "*.dance" || "$replace" == "*.data" || "$replace" == "*.date" || "$replace" == "*.dating" || "$replace" == "*.datsun" || "$replace" == "*.day" || "$replace" == "*.dclk" || "$replace" == "*.dds" || "$replace" == "*.de" || "$replace" == "*.deal" || "$replace" == "*.dealer" || "$replace" == "*.deals" || "$replace" == "*.degree" || "$replace" == "*.delivery" || "$replace" == "*.dell" || "$replace" == "*.deloitte" || "$replace" == "*.delta" || "$replace" == "*.democrat" || "$replace" == "*.dental" || "$replace" == "*.dentist" || "$replace" == "*.desi" || "$replace" == "*.design" || "$replace" == "*.dev" || "$replace" == "*.dhl" || "$replace" == "*.diamonds" || "$replace" == "*.diet" || "$replace" == "*.digital" || "$replace" == "*.direct" || "$replace" == "*.directory" || "$replace" == "*.discount" || "$replace" == "*.discover" || "$replace" == "*.dish" || "$replace" == "*.diy" || "$replace" == "*.dj" || "$replace" == "*.dk" || "$replace" == "*.dm" || "$replace" == "*.dnp" || "$replace" == "*.do" || "$replace" == "*.docs" || "$replace" == "*.doctor" || "$replace" == "*.dodge" || "$replace" == "*.dog" || "$replace" == "*.doha" || "$replace" == "*.domains" || "$replace" == "*.doosan" || "$replace" == "*.dot" || "$replace" == "*.download" || "$replace" == "*.drive" || "$replace" == "*.dtv" || "$replace" == "*.dubai" || "$replace" == "*.duck" || "$replace" == "*.dunlop" || "$replace" == "*.duns" || "$replace" == "*.dupont" || "$replace" == "*.durban" || "$replace" == "*.dvag" || "$replace" == "*.dvr" || "$replace" == "*.dz" || "$replace" == "*.earth" || "$replace" == "*.eat" || "$replace" == "*.ec" || "$replace" == "*.eco" || "$replace" == "*.edeka" || "$replace" == "*.edu" || "$replace" == "*.education" || "$replace" == "*.ee" || "$replace" == "*.eg" || "$replace" == "*.eh" || "$replace" == "*.email" || "$replace" == "*.emerck" || "$replace" == "*.energy" || "$replace" == "*.engineer" || "$replace" == "*.engineering" || "$replace" == "*.enterprises" || "$replace" == "*.epost" || "$replace" == "*.epson" || "$replace" == "*.equipment" || "$replace" == "*.er" || "$replace" == "*.ericsson" || "$replace" == "*.erni" || "$replace" == "*.es" || "$replace" == "*.esq" || "$replace" == "*.estate" || "$replace" == "*.esurance" || "$replace" == "*.et" || "$replace" == "*.etisalat" || "$replace" == "*.eu" || "$replace" == "*.eurovision" || "$replace" == "*.eus" || "$replace" == "*.events" || "$replace" == "*.everbank" || "$replace" == "*.exchange" || "$replace" == "*.expert" || "$replace" == "*.exposed" || "$replace" == "*.express" || "$replace" == "*.extraspace" || "$replace" == "*.fage" || "$replace" == "*.fail" || "$replace" == "*.fairwinds" || "$replace" == "*.faith" || "$replace" == "*.family" || "$replace" == "*.fan" || "$replace" == "*.fans" || "$replace" == "*.farm" || "$replace" == "*.farmers" || "$replace" == "*.fashion" || "$replace" == "*.fast" || "$replace" == "*.fedex" || "$replace" == "*.feedback" || "$replace" == "*.ferrari" || "$replace" == "*.ferrero" || "$replace" == "*.fi" || "$replace" == "*.fiat" || "$replace" == "*.fidelity" || "$replace" == "*.fido" || "$replace" == "*.film" || "$replace" == "*.final" || "$replace" == "*.finance" || "$replace" == "*.financial" || "$replace" == "*.fire" || "$replace" == "*.firestone" || "$replace" == "*.firmdale" || "$replace" == "*.fish" || "$replace" == "*.fishing" || "$replace" == "*.fit" || "$replace" == "*.fitness" || "$replace" == "*.fj" || "$replace" == "*.fk" || "$replace" == "*.flickr" || "$replace" == "*.flights" || "$replace" == "*.flir" || "$replace" == "*.florist" || "$replace" == "*.flowers" || "$replace" == "*.flsmidth" || "$replace" == "*.fly" || "$replace" == "*.fm" || "$replace" == "*.fo" || "$replace" == "*.foo" || "$replace" == "*.food" || "$replace" == "*.foodnetwork" || "$replace" == "*.football" || "$replace" == "*.ford" || "$replace" == "*.forex" || "$replace" == "*.forsale" || "$replace" == "*.forum" || "$replace" == "*.foundation" || "$replace" == "*.fox" || "$replace" == "*.fr" || "$replace" == "*.free" || "$replace" == "*.fresenius" || "$replace" == "*.frl" || "$replace" == "*.frogans" || "$replace" == "*.frontdoor" || "$replace" == "*.frontier" || "$replace" == "*.ftr" || "$replace" == "*.fujitsu" || "$replace" == "*.fujixerox" || "$replace" == "*.fun" || "$replace" == "*.fund" || "$replace" == "*.furniture" || "$replace" == "*.futbol" || "$replace" == "*.fyi" || "$replace" == "*.ga" || "$replace" == "*.gal" || "$replace" == "*.gallery" || "$replace" == "*.gallo" || "$replace" == "*.gallup" || "$replace" == "*.game" || "$replace" == "*.games" || "$replace" == "*.gap" || "$replace" == "*.garden" || "$replace" == "*.gay" || "$replace" == "*.gb" || "$replace" == "*.gbiz" || "$replace" == "*.gd" || "$replace" == "*.gdn" || "$replace" == "*.ge" || "$replace" == "*.gea" || "$replace" == "*.gent" || "$replace" == "*.genting" || "$replace" == "*.george" || "$replace" == "*.gf" || "$replace" == "*.gg" || "$replace" == "*.ggee" || "$replace" == "*.gh" || "$replace" == "*.gi" || "$replace" == "*.gift" || "$replace" == "*.gifts" || "$replace" == "*.gives" || "$replace" == "*.giving" || "$replace" == "*.gl" || "$replace" == "*.glade" || "$replace" == "*.glass" || "$replace" == "*.gle" || "$replace" == "*.global" || "$replace" == "*.globo" || "$replace" == "*.gm" || "$replace" == "*.gmail" || "$replace" == "*.gmbh" || "$replace" == "*.gmo" || "$replace" == "*.gmx" || "$replace" == "*.gn" || "$replace" == "*.godaddy" || "$replace" == "*.gold" || "$replace" == "*.goldpoint" || "$replace" == "*.golf" || "$replace" == "*.goo" || "$replace" == "*.goodhands" || "$replace" == "*.goodyear" || "$replace" == "*.goog" || "$replace" == "*.google" || "$replace" == "*.gop" || "$replace" == "*.got" || "$replace" == "*.gov" || "$replace" == "*.gp" || "$replace" == "*.gq" || "$replace" == "*.gr" || "$replace" == "*.grainger" || "$replace" == "*.graphics" || "$replace" == "*.gratis" || "$replace" == "*.green" || "$replace" == "*.gripe" || "$replace" == "*.grocery" || "$replace" == "*.group" || "$replace" == "*.gs" || "$replace" == "*.gt" || "$replace" == "*.gu" || "$replace" == "*.guardian" || "$replace" == "*.gucci" || "$replace" == "*.guge" || "$replace" == "*.guide" || "$replace" == "*.guitars" || "$replace" == "*.guru" || "$replace" == "*.gw" || "$replace" == "*.gy" || "$replace" == "*.hair" || "$replace" == "*.hamburg" || "$replace" == "*.hangout" || "$replace" == "*.haus" || "$replace" == "*.hbo" || "$replace" == "*.hdfc" || "$replace" == "*.hdfcbank" || "$replace" == "*.health" || "$replace" == "*.healthcare" || "$replace" == "*.help" || "$replace" == "*.helsinki" || "$replace" == "*.here" || "$replace" == "*.hermes" || "$replace" == "*.hgtv" || "$replace" == "*.hiphop" || "$replace" == "*.hisamitsu" || "$replace" == "*.hitachi" || "$replace" == "*.hiv" || "$replace" == "*.hk" || "$replace" == "*.hkt" || "$replace" == "*.hm" || "$replace" == "*.hn" || "$replace" == "*.hockey" || "$replace" == "*.holdings" || "$replace" == "*.holiday" || "$replace" == "*.homedepot" || "$replace" == "*.homegoods" || "$replace" == "*.homes" || "$replace" == "*.homesense" || "$replace" == "*.honda" || "$replace" == "*.honeywell" || "$replace" == "*.horse" || "$replace" == "*.hospital" || "$replace" == "*.host" || "$replace" == "*.hosting" || "$replace" == "*.hot" || "$replace" == "*.hoteles" || "$replace" == "*.hotels" || "$replace" == "*.hotmail" || "$replace" == "*.house" || "$replace" == "*.how" || "$replace" == "*.hr" || "$replace" == "*.hsbc" || "$replace" == "*.ht" || "$replace" == "*.htc" || "$replace" == "*.hu" || "$replace" == "*.hughes" || "$replace" == "*.hyatt" || "$replace" == "*.hyundai" || "$replace" == "*.ibm" || "$replace" == "*.icbc" || "$replace" == "*.ice" || "$replace" == "*.icu" || "$replace" == "*.id" || "$replace" == "*.ie" || "$replace" == "*.ieee" || "$replace" == "*.ifm" || "$replace" == "*.iinet" || "$replace" == "*.ikano" || "$replace" == "*.il" || "$replace" == "*.im" || "$replace" == "*.imamat" || "$replace" == "*.imdb" || "$replace" == "*.immo" || "$replace" == "*.immobilien" || "$replace" == "*.in" || "$replace" == "*.inc" || "$replace" == "*.industries" || "$replace" == "*.infiniti" || "$replace" == "*.info" || "$replace" == "*.ing" || "$replace" == "*.ink" || "$replace" == "*.institute" || "$replace" == "*.insurance" || "$replace" == "*.insure" || "$replace" == "*.int" || "$replace" == "*.intel" || "$replace" == "*.international" || "$replace" == "*.intuit" || "$replace" == "*.investments" || "$replace" == "*.io" || "$replace" == "*.ipiranga" || "$replace" == "*.iq" || "$replace" == "*.ir" || "$replace" == "*.irish" || "$replace" == "*.is" || "$replace" == "*.iselect" || "$replace" == "*.ismaili" || "$replace" == "*.ist" || "$replace" == "*.istanbul" || "$replace" == "*.it" || "$replace" == "*.itau" || "$replace" == "*.itv" || "$replace" == "*.iveco" || "$replace" == "*.iwc" || "$replace" == "*.jaguar" || "$replace" == "*.java" || "$replace" == "*.jcb" || "$replace" == "*.jcp" || "$replace" == "*.je" || "$replace" == "*.jeep" || "$replace" == "*.jetzt" || "$replace" == "*.jewelry" || "$replace" == "*.jio" || "$replace" == "*.jlc" || "$replace" == "*.jll" || "$replace" == "*.jm" || "$replace" == "*.jmp" || "$replace" == "*.jnj" || "$replace" == "*.jo" || "$replace" == "*.jobs" || "$replace" == "*.joburg" || "$replace" == "*.jot" || "$replace" == "*.joy" || "$replace" == "*.jp" || "$replace" == "*.jpmorgan" || "$replace" == "*.jprs" || "$replace" == "*.juegos" || "$replace" == "*.juniper" || "$replace" == "*.kaufen" || "$replace" == "*.kddi" || "$replace" == "*.ke" || "$replace" == "*.kerryhotels" || "$replace" == "*.kerrylogistics" || "$replace" == "*.kerryproperties" || "$replace" == "*.kfh" || "$replace" == "*.kg" || "$replace" == "*.kh" || "$replace" == "*.ki" || "$replace" == "*.kia" || "$replace" == "*.kim" || "$replace" == "*.kinder" || "$replace" == "*.kindle" || "$replace" == "*.kitchen" || "$replace" == "*.kiwi" || "$replace" == "*.km" || "$replace" == "*.kn" || "$replace" == "*.koeln" || "$replace" == "*.komatsu" || "$replace" == "*.kosher" || "$replace" == "*.kp" || "$replace" == "*.kpmg" || "$replace" == "*.kpn" || "$replace" == "*.kr" || "$replace" == "*.krd" || "$replace" == "*.kred" || "$replace" == "*.kuokgroup" || "$replace" == "*.kw" || "$replace" == "*.ky" || "$replace" == "*.kyoto" || "$replace" == "*.kz" || "$replace" == "*.la" || "$replace" == "*.lacaixa" || "$replace" == "*.ladbrokes" || "$replace" == "*.lamborghini" || "$replace" == "*.lamer" || "$replace" == "*.lancaster" || "$replace" == "*.lancia" || "$replace" == "*.lancome" || "$replace" == "*.land" || "$replace" == "*.landrover" || "$replace" == "*.lanxess" || "$replace" == "*.lasalle" || "$replace" == "*.lat" || "$replace" == "*.latino" || "$replace" == "*.latrobe" || "$replace" == "*.law" || "$replace" == "*.lawyer" || "$replace" == "*.lb" || "$replace" == "*.lc" || "$replace" == "*.lds" || "$replace" == "*.lease" || "$replace" == "*.leclerc" || "$replace" == "*.lefrak" || "$replace" == "*.legal" || "$replace" == "*.lego" || "$replace" == "*.lexus" || "$replace" == "*.lgbt" || "$replace" == "*.li" || "$replace" == "*.liaison" || "$replace" == "*.lidl" || "$replace" == "*.life" || "$replace" == "*.lifeinsurance" || "$replace" == "*.lifestyle" || "$replace" == "*.lighting" || "$replace" == "*.like" || "$replace" == "*.lilly" || "$replace" == "*.limited" || "$replace" == "*.limo" || "$replace" == "*.lincoln" || "$replace" == "*.linde" || "$replace" == "*.link" || "$replace" == "*.lipsy" || "$replace" == "*.live" || "$replace" == "*.living" || "$replace" == "*.lixil" || "$replace" == "*.lk" || "$replace" == "*.llc" || "$replace" == "*.llp" || "$replace" == "*.loan" || "$replace" == "*.loans" || "$replace" == "*.locker" || "$replace" == "*.locus" || "$replace" == "*.loft" || "$replace" == "*.lol" || "$replace" == "*.london" || "$replace" == "*.lotte" || "$replace" == "*.lotto" || "$replace" == "*.love" || "$replace" == "*.lpl" || "$replace" == "*.lplfinancial" || "$replace" == "*.lr" || "$replace" == "*.ls" || "$replace" == "*.lt" || "$replace" == "*.ltd" || "$replace" == "*.ltda" || "$replace" == "*.lu" || "$replace" == "*.lundbeck" || "$replace" == "*.lupin" || "$replace" == "*.luxe" || "$replace" == "*.luxury" || "$replace" == "*.lv" || "$replace" == "*.ma" || "$replace" == "*.macys" || "$replace" == "*.madrid" || "$replace" == "*.maif" || "$replace" == "*.maison" || "$replace" == "*.makeup" || "$replace" == "*.man" || "$replace" == "*.management" || "$replace" == "*.mango" || "$replace" == "*.map" || "$replace" == "*.market" || "$replace" == "*.marketing" || "$replace" == "*.markets" || "$replace" == "*.marriott" || "$replace" == "*.marshalls" || "$replace" == "*.maserati" || "$replace" == "*.mattel" || "$replace" == "*.mba" || "$replace" == "*.mc" || "$replace" == "*.mcd" || "$replace" == "*.mcdonalds" || "$replace" == "*.mckinsey" || "$replace" == "*.md" || "$replace" == "*.me" || "$replace" == "*.med" || "$replace" == "*.media" || "$replace" == "*.meet" || "$replace" == "*.melbourne" || "$replace" == "*.meme" || "$replace" == "*.memorial" || "$replace" == "*.men" || "$replace" == "*.menu" || "$replace" == "*.meo" || "$replace" == "*.merckmsd" || "$replace" == "*.metlife" || "$replace" == "*.mf" || "$replace" == "*.mg" || "$replace" == "*.mh" || "$replace" == "*.miami" || "$replace" == "*.microsoft" || "$replace" == "*.mil" || "$replace" == "*.mini" || "$replace" == "*.mint" || "$replace" == "*.mit" || "$replace" == "*.mitsubishi" || "$replace" == "*.mk" || "$replace" == "*.ml" || "$replace" == "*.mlb" || "$replace" == "*.mls" || "$replace" == "*.mm" || "$replace" == "*.mma" || "$replace" == "*.mn" || "$replace" == "*.mo" || "$replace" == "*.mobi" || "$replace" == "*.mobile" || "$replace" == "*.mobily" || "$replace" == "*.moda" || "$replace" == "*.moe" || "$replace" == "*.moi" || "$replace" == "*.mom" || "$replace" == "*.monash" || "$replace" == "*.money" || "$replace" == "*.monster" || "$replace" == "*.montblanc" || "$replace" == "*.mopar" || "$replace" == "*.mormon" || "$replace" == "*.mortgage" || "$replace" == "*.moscow" || "$replace" == "*.moto" || "$replace" == "*.motorcycles" || "$replace" == "*.mov" || "$replace" == "*.movie" || "$replace" == "*.movistar" || "$replace" == "*.mp" || "$replace" == "*.mq" || "$replace" == "*.mr" || "$replace" == "*.ms" || "$replace" == "*.msd" || "$replace" == "*.mt" || "$replace" == "*.mtn" || "$replace" == "*.mtpc" || "$replace" == "*.mtr" || "$replace" == "*.mu" || "$replace" == "*.museum" || "$replace" == "*.mutual" || "$replace" == "*.mutuelle" || "$replace" == "*.mv" || "$replace" == "*.mw" || "$replace" == "*.mx" || "$replace" == "*.my" || "$replace" == "*.mz" || "$replace" == "*.na" || "$replace" == "*.nab" || "$replace" == "*.nadex" || "$replace" == "*.nagoya" || "$replace" == "*.name" || "$replace" == "*.nationwide" || "$replace" == "*.natura" || "$replace" == "*.navy" || "$replace" == "*.nba" || "$replace" == "*.nc" || "$replace" == "*.ne" || "$replace" == "*.nec" || "$replace" == "*.net" || "$replace" == "*.netbank" || "$replace" == "*.netflix" || "$replace" == "*.network" || "$replace" == "*.neustar" || "$replace" == "*.new" || "$replace" == "*.newholland" || "$replace" == "*.news" || "$replace" == "*.next" || "$replace" == "*.nextdirect" || "$replace" == "*.nexus" || "$replace" == "*.nf" || "$replace" == "*.nfl" || "$replace" == "*.ng" || "$replace" == "*.ngo" || "$replace" == "*.nhk" || "$replace" == "*.ni" || "$replace" == "*.nico" || "$replace" == "*.nike" || "$replace" == "*.nikon" || "$replace" == "*.ninja" || "$replace" == "*.nissan" || "$replace" == "*.nissay" || "$replace" == "*.nl" || "$replace" == "*.no" || "$replace" == "*.nokia" || "$replace" == "*.northwesternmutual" || "$replace" == "*.norton" || "$replace" == "*.now" || "$replace" == "*.nowruz" || "$replace" == "*.nowtv" || "$replace" == "*.np" || "$replace" == "*.nr" || "$replace" == "*.nra" || "$replace" == "*.nrw" || "$replace" == "*.ntt" || "$replace" == "*.nu" || "$replace" == "*.nyc" || "$replace" == "*.nz" || "$replace" == "*.obi" || "$replace" == "*.observer" || "$replace" == "*.off" || "$replace" == "*.office" || "$replace" == "*.okinawa" || "$replace" == "*.olayan" || "$replace" == "*.olayangroup" || "$replace" == "*.oldnavy" || "$replace" == "*.ollo" || "$replace" == "*.om" || "$replace" == "*.omega" || "$replace" == "*.one" || "$replace" == "*.ong" || "$replace" == "*.onl" || "$replace" == "*.online" || "$replace" == "*.onyourside" || "$replace" == "*.ooo" || "$replace" == "*.open" || "$replace" == "*.oracle" || "$replace" == "*.orange" || "$replace" == "*.org" || "$replace" == "*.organic" || "$replace" == "*.orientexpress" || "$replace" == "*.origins" || "$replace" == "*.osaka" || "$replace" == "*.otsuka" || "$replace" == "*.ott" || "$replace" == "*.ovh" || "$replace" == "*.pa" || "$replace" == "*.page" || "$replace" == "*.pamperedchef" || "$replace" == "*.panasonic" || "$replace" == "*.panerai" || "$replace" == "*.paris" || "$replace" == "*.pars" || "$replace" == "*.partners" || "$replace" == "*.parts" || "$replace" == "*.party" || "$replace" == "*.passagens" || "$replace" == "*.pay" || "$replace" == "*.pccw" || "$replace" == "*.pe" || "$replace" == "*.pet" || "$replace" == "*.pf" || "$replace" == "*.pfizer" || "$replace" == "*.pg" || "$replace" == "*.ph" || "$replace" == "*.pharmacy" || "$replace" == "*.phd" || "$replace" == "*.philips" || "$replace" == "*.phone" || "$replace" == "*.photo" || "$replace" == "*.photography" || "$replace" == "*.photos" || "$replace" == "*.physio" || "$replace" == "*.piaget" || "$replace" == "*.pics" || "$replace" == "*.pictet" || "$replace" == "*.pictures" || "$replace" == "*.pid" || "$replace" == "*.pin" || "$replace" == "*.ping" || "$replace" == "*.pink" || "$replace" == "*.pioneer" || "$replace" == "*.pizza" || "$replace" == "*.pk" || "$replace" == "*.pl" || "$replace" == "*.place" || "$replace" == "*.play" || "$replace" == "*.playstation" || "$replace" == "*.plumbing" || "$replace" == "*.plus" || "$replace" == "*.pm" || "$replace" == "*.pn" || "$replace" == "*.pnc" || "$replace" == "*.pohl" || "$replace" == "*.poker" || "$replace" == "*.politie" || "$replace" == "*.porn" || "$replace" == "*.post" || "$replace" == "*.pr" || "$replace" == "*.pramerica" || "$replace" == "*.praxi" || "$replace" == "*.press" || "$replace" == "*.prime" || "$replace" == "*.pro" || "$replace" == "*.prod" || "$replace" == "*.productions" || "$replace" == "*.prof" || "$replace" == "*.progressive" || "$replace" == "*.promo" || "$replace" == "*.properties" || "$replace" == "*.property" || "$replace" == "*.protection" || "$replace" == "*.pru" || "$replace" == "*.prudential" || "$replace" == "*.ps" || "$replace" == "*.pt" || "$replace" == "*.pub" || "$replace" == "*.pw" || "$replace" == "*.pwc" || "$replace" == "*.py" || "$replace" == "*.qa" || "$replace" == "*.qpon" || "$replace" == "*.quebec" || "$replace" == "*.quest" || "$replace" == "*.qvc" || "$replace" == "*.racing" || "$replace" == "*.radio" || "$replace" == "*.raid" || "$replace" == "*.re" || "$replace" == "*.read" || "$replace" == "*.realestate" || "$replace" == "*.realtor" || "$replace" == "*.realty" || "$replace" == "*.recipes" || "$replace" == "*.red" || "$replace" == "*.redstone" || "$replace" == "*.redumbrella" || "$replace" == "*.rehab" || "$replace" == "*.reise" || "$replace" == "*.reisen" || "$replace" == "*.reit" || "$replace" == "*.reliance" || "$replace" == "*.ren" || "$replace" == "*.rent" || "$replace" == "*.rentals" || "$replace" == "*.repair" || "$replace" == "*.report" || "$replace" == "*.republican" || "$replace" == "*.rest" || "$replace" == "*.restaurant" || "$replace" == "*.review" || "$replace" == "*.reviews" || "$replace" == "*.rexroth" || "$replace" == "*.rich" || "$replace" == "*.richardli" || "$replace" == "*.ricoh" || "$replace" == "*.rightathome" || "$replace" == "*.ril" || "$replace" == "*.rio" || "$replace" == "*.rip" || "$replace" == "*.rmit" || "$replace" == "*.ro" || "$replace" == "*.rocher" || "$replace" == "*.rocks" || "$replace" == "*.rodeo" || "$replace" == "*.rogers" || "$replace" == "*.room" || "$replace" == "*.rs" || "$replace" == "*.rsvp" || "$replace" == "*.ru" || "$replace" == "*.rugby" || "$replace" == "*.ruhr" || "$replace" == "*.run" || "$replace" == "*.rw" || "$replace" == "*.rwe" || "$replace" == "*.ryukyu" || "$replace" == "*.sa" || "$replace" == "*.saarland" || "$replace" == "*.safe" || "$replace" == "*.safety" || "$replace" == "*.sakura" || "$replace" == "*.sale" || "$replace" == "*.salon" || "$replace" == "*.samsclub" || "$replace" == "*.samsung" || "$replace" == "*.sandvik" || "$replace" == "*.sandvikcoromant" || "$replace" == "*.sanofi" || "$replace" == "*.sap" || "$replace" == "*.sapo" || "$replace" == "*.sarl" || "$replace" == "*.sas" || "$replace" == "*.save" || "$replace" == "*.saxo" || "$replace" == "*.sb" || "$replace" == "*.sbi" || "$replace" == "*.sbs" || "$replace" == "*.sc" || "$replace" == "*.sca" || "$replace" == "*.scb" || "$replace" == "*.schaeffler" || "$replace" == "*.schmidt" || "$replace" == "*.scholarships" || "$replace" == "*.school" || "$replace" == "*.schule" || "$replace" == "*.schwarz" || "$replace" == "*.science" || "$replace" == "*.scjohnson" || "$replace" == "*.scor" || "$replace" == "*.scot" || "$replace" == "*.sd" || "$replace" == "*.se" || "$replace" == "*.search" || "$replace" == "*.seat" || "$replace" == "*.secure" || "$replace" == "*.security" || "$replace" == "*.seek" || "$replace" == "*.select" || "$replace" == "*.sener" || "$replace" == "*.services" || "$replace" == "*.ses" || "$replace" == "*.seven" || "$replace" == "*.sew" || "$replace" == "*.sex" || "$replace" == "*.sexy" || "$replace" == "*.sfr" || "$replace" == "*.sg" || "$replace" == "*.sh" || "$replace" == "*.shangrila" || "$replace" == "*.sharp" || "$replace" == "*.shaw" || "$replace" == "*.shell" || "$replace" == "*.shia" || "$replace" == "*.shiksha" || "$replace" == "*.shoes" || "$replace" == "*.shop" || "$replace" == "*.shopping" || "$replace" == "*.shouji" || "$replace" == "*.show" || "$replace" == "*.showtime" || "$replace" == "*.shriram" || "$replace" == "*.si" || "$replace" == "*.silk" || "$replace" == "*.sina" || "$replace" == "*.singles" || "$replace" == "*.site" || "$replace" == "*.sj" || "$replace" == "*.sk" || "$replace" == "*.ski" || "$replace" == "*.skin" || "$replace" == "*.sky" || "$replace" == "*.skype" || "$replace" == "*.sl" || "$replace" == "*.sling" || "$replace" == "*.sm" || "$replace" == "*.smart" || "$replace" == "*.smile" || "$replace" == "*.sn" || "$replace" == "*.sncf" || "$replace" == "*.so" || "$replace" == "*.soccer" || "$replace" == "*.social" || "$replace" == "*.softbank" || "$replace" == "*.software" || "$replace" == "*.sohu" || "$replace" == "*.solar" || "$replace" == "*.solutions" || "$replace" == "*.song" || "$replace" == "*.sony" || "$replace" == "*.soy" || "$replace" == "*.spa" || "$replace" == "*.space" || "$replace" == "*.spiegel" || "$replace" == "*.sport" || "$replace" == "*.spot" || "$replace" == "*.spreadbetting" || "$replace" == "*.sr" || "$replace" == "*.srl" || "$replace" == "*.srt" || "$replace" == "*.ss" || "$replace" == "*.st" || "$replace" == "*.stada" || "$replace" == "*.staples" || "$replace" == "*.star" || "$replace" == "*.starhub" || "$replace" == "*.statebank" || "$replace" == "*.statefarm" || "$replace" == "*.statoil" || "$replace" == "*.stc" || "$replace" == "*.stcgroup" || "$replace" == "*.stockholm" || "$replace" == "*.storage" || "$replace" == "*.store" || "$replace" == "*.stream" || "$replace" == "*.studio" || "$replace" == "*.study" || "$replace" == "*.style" || "$replace" == "*.su" || "$replace" == "*.sucks" || "$replace" == "*.supplies" || "$replace" == "*.supply" || "$replace" == "*.support" || "$replace" == "*.surf" || "$replace" == "*.surgery" || "$replace" == "*.suzuki" || "$replace" == "*.sv" || "$replace" == "*.swatch" || "$replace" == "*.swiftcover" || "$replace" == "*.swiss" || "$replace" == "*.sx" || "$replace" == "*.sy" || "$replace" == "*.sydney" || "$replace" == "*.symantec" || "$replace" == "*.systems" || "$replace" == "*.sz" || "$replace" == "*.tab" || "$replace" == "*.taipei" || "$replace" == "*.talk" || "$replace" == "*.taobao" || "$replace" == "*.target" || "$replace" == "*.tatamotors" || "$replace" == "*.tatar" || "$replace" == "*.tattoo" || "$replace" == "*.tax" || "$replace" == "*.taxi" || "$replace" == "*.tc" || "$replace" == "*.tci" || "$replace" == "*.td" || "$replace" == "*.tdk" || "$replace" == "*.team" || "$replace" == "*.tech" || "$replace" == "*.technology" || "$replace" == "*.tel" || "$replace" == "*.telecity" || "$replace" == "*.telefonica" || "$replace" == "*.temasek" || "$replace" == "*.tennis" || "$replace" == "*.teva" || "$replace" == "*.tf" || "$replace" == "*.tg" || "$replace" == "*.th" || "$replace" == "*.thd" || "$replace" == "*.theater" || "$replace" == "*.theatre" || "$replace" == "*.tiaa" || "$replace" == "*.tickets" || "$replace" == "*.tienda" || "$replace" == "*.tiffany" || "$replace" == "*.tips" || "$replace" == "*.tires" || "$replace" == "*.tirol" || "$replace" == "*.tj" || "$replace" == "*.tjmaxx" || "$replace" == "*.tjx" || "$replace" == "*.tk" || "$replace" == "*.tkmaxx" || "$replace" == "*.tl" || "$replace" == "*.tm" || "$replace" == "*.tmall" || "$replace" == "*.tn" || "$replace" == "*.to" || "$replace" == "*.today" || "$replace" == "*.tokyo" || "$replace" == "*.tools" || "$replace" == "*.top" || "$replace" == "*.toray" || "$replace" == "*.toshiba" || "$replace" == "*.total" || "$replace" == "*.tours" || "$replace" == "*.town" || "$replace" == "*.toyota" || "$replace" == "*.toys" || "$replace" == "*.tp" || "$replace" == "*.tr" || "$replace" == "*.trade" || "$replace" == "*.trading" || "$replace" == "*.training" || "$replace" == "*.travel" || "$replace" == "*.travelchannel" || "$replace" == "*.travelers" || "$replace" == "*.travelersinsurance" || "$replace" == "*.trust" || "$replace" == "*.trv" || "$replace" == "*.tt" || "$replace" == "*.tube" || "$replace" == "*.tui" || "$replace" == "*.tunes" || "$replace" == "*.tushu" || "$replace" == "*.tv" || "$replace" == "*.tvs" || "$replace" == "*.tw" || "$replace" == "*.tz" || "$replace" == "*.ua" || "$replace" == "*.ubank" || "$replace" == "*.ubs" || "$replace" == "*.uconnect" || "$replace" == "*.ug" || "$replace" == "*.uk" || "$replace" == "*.um" || "$replace" == "*.unicom" || "$replace" == "*.university" || "$replace" == "*.uno" || "$replace" == "*.uol" || "$replace" == "*.ups" || "$replace" == "*.us" || "$replace" == "*.uy" || "$replace" == "*.uz" || "$replace" == "*.va" || "$replace" == "*.vacations" || "$replace" == "*.vana" || "$replace" == "*.vanguard" || "$replace" == "*.vc" || "$replace" == "*.ve" || "$replace" == "*.vegas" || "$replace" == "*.ventures" || "$replace" == "*.verisign" || "$replace" == "*.vermögensberater" || "$replace" == "*.vermögensberatung" || "$replace" == "*.versicherung" || "$replace" == "*.vet" || "$replace" == "*.vg" || "$replace" == "*.vi" || "$replace" == "*.viajes" || "$replace" == "*.video" || "$replace" == "*.vig" || "$replace" == "*.viking" || "$replace" == "*.villas" || "$replace" == "*.vin" || "$replace" == "*.vip" || "$replace" == "*.virgin" || "$replace" == "*.visa" || "$replace" == "*.vision" || "$replace" == "*.vista" || "$replace" == "*.vistaprint" || "$replace" == "*.viva" || "$replace" == "*.vivo" || "$replace" == "*.vlaanderen" || "$replace" == "*.vn" || "$replace" == "*.vodka" || "$replace" == "*.volkswagen" || "$replace" == "*.volvo" || "$replace" == "*.vote" || "$replace" == "*.voting" || "$replace" == "*.voto" || "$replace" == "*.voyage" || "$replace" == "*.vu" || "$replace" == "*.vuelos" || "$replace" == "*.wales" || "$replace" == "*.walmart" || "$replace" == "*.walter" || "$replace" == "*.wang" || "$replace" == "*.wanggou" || "$replace" == "*.warman" || "$replace" == "*.watch" || "$replace" == "*.watches" || "$replace" == "*.weather" || "$replace" == "*.weatherchannel" || "$replace" == "*.webcam" || "$replace" == "*.weber" || "$replace" == "*.website" || "$replace" == "*.wed" || "$replace" == "*.wedding" || "$replace" == "*.weibo" || "$replace" == "*.weir" || "$replace" == "*.wf" || "$replace" == "*.whoswho" || "$replace" == "*.wien" || "$replace" == "*.wiki" || "$replace" == "*.williamhill" || "$replace" == "*.win" || "$replace" == "*.windows" || "$replace" == "*.wine" || "$replace" == "*.winners" || "$replace" == "*.wme" || "$replace" == "*.wolterskluwer" || "$replace" == "*.woodside" || "$replace" == "*.work" || "$replace" == "*.works" || "$replace" == "*.world" || "$replace" == "*.wow" || "$replace" == "*.ws" || "$replace" == "*.wtc" || "$replace" == "*.wtf" || "$replace" == "*.xbox" || "$replace" == "*.xerox" || "$replace" == "*.xfinity" || "$replace" == "*.xihuan" || "$replace" == "*.xin" || "$replace" == "*.xperia" || "$replace" == "*.xxx" || "$replace" == "*.xyz" || "$replace" == "*.yachts" || "$replace" == "*.yahoo" || "$replace" == "*.yamaxun" || "$replace" == "*.yandex" || "$replace" == "*.ye" || "$replace" == "*.yodobashi" || "$replace" == "*.yoga" || "$replace" == "*.yokohama" || "$replace" == "*.you" || "$replace" == "*.youtube" || "$replace" == "*.yt" || "$replace" == "*.yun" || "$replace" == "*.za" || "$replace" == "*.zappos" || "$replace" == "*.zara" || "$replace" == "*.zero" || "$replace" == "*.zip" || "$replace" == "*.zippo" || "$replace" == "*.zm" || "$replace" == "*.zone" || "$replace" == "*.zuerich" || "$replace" == "*.zw" || "$replace" == "*.δοκιμή" || "$replace" == "*.ελ" || "$replace" == "*.ευ" || "$replace" == "*.бг" || "$replace" == "*.бел" || "$replace" == "*.дети" || "$replace" == "*.ею" || "$replace" == "*.испытание" || "$replace" == "*.католик" || "$replace" == "*.ком" || "$replace" == "*.мкд" || "$replace" == "*.мон" || "$replace" == "*.москва" || "$replace" == "*.онлайн" || "$replace" == "*.орг" || "$replace" == "*.рус" || "$replace" == "*.рф" || "$replace" == "*.сайт" || "$replace" == "*.срб" || "$replace" == "*.укр" || "$replace" == "*.қаз" || "$replace" == "*.հայ" || "$replace" == "*.טעסט" || "$replace" == "*.ישראל" || "$replace" == "*.קום" || "$replace" == "*.آزمایشی" || "$replace" == "*.إختبار" || "$replace" == "*.ابوظبي" || "$replace" == "*.اتصالات" || "$replace" == "*.ارامكو" || "$replace" == "*.الاردن" || "$replace" == "*.البحرين" || "$replace" == "*.الجزائر" || "$replace" == "*.السعودية" || "$replace" == "*.العليان" || "$replace" == "*.المغرب" || "$replace" == "*.امارات" || "$replace" == "*.ایران" || "$replace" == "*.بارت" || "$replace" == "*.بازار" || "$replace" == "*.بيتك" || "$replace" == "*.بھارت" || "$replace" == "*.تونس" || "$replace" == "*.سودان" || "$replace" == "*.سورية" || "$replace" == "*.شبكة" || "$replace" == "*.عراق" || "$replace" == "*.عرب" || "$replace" == "*.عمان" || "$replace" == "*.فلسطين" || "$replace" == "*.قطر" || "$replace" == "*.كاثوليك" || "$replace" == "*.كوم" || "$replace" == "*.مصر" || "$replace" == "*.مليسيا" || "$replace" == "*.موبايلي" || "$replace" == "*.موريتانيا" || "$replace" == "*.موقع" || "$replace" == "*.همراه" || "$replace" == "*.پاكستان" || "$replace" == "*.پاکستان" || "$replace" == "*.ڀارت" || "$replace" == "*.कॉम" || "$replace" == "*.नेट" || "$replace" == "*.परीक्षा" || "$replace" == "*.भारत" || "$replace" == "*.भारतम्" || "$replace" == "*.भारोत" || "$replace" == "*.संगठन" || "$replace" == "*.বাংলা" || "$replace" == "*.ভারত" || "$replace" == "*.ভাৰত" || "$replace" == "*.ਭਾਰਤ" || "$replace" == "*.ભારત" || "$replace" == "*.ଭାରତ" || "$replace" == "*.இந்தியா" || "$replace" == "*.இலங்கை" || "$replace" == "*.சிங்கப்பூர்" || "$replace" == "*.பரிட்சை" || "$replace" == "*.భారత్" || "$replace" == "*.ಭಾರತ" || "$replace" == "*.ഭാരതം" || "$replace" == "*.ලංකා" || "$replace" == "*.คอม" || "$replace" == "*.ไทย" || "$replace" == "*.ລາວ" || "$replace" == "*.გე" || "$replace" == "*.みんな" || "$replace" == "*.アマゾン" || "$replace" == "*.クラウド" || "$replace" == "*.グーグル" || "$replace" == "*.コム" || "$replace" == "*.ストア" || "$replace" == "*.セール" || "$replace" == "*.テスト" || "$replace" == "*.ファッション" || "$replace" == "*.ポイント" || "$replace" == "*.世界" || "$replace" == "*.中信" || "$replace" == "*.中国" || "$replace" == "*.中國" || "$replace" == "*.中文网" || "$replace" == "*.亚马逊" || "$replace" == "*.企业" || "$replace" == "*.佛山" || "$replace" == "*.信息" || "$replace" == "*.健康" || "$replace" == "*.八卦" || "$replace" == "*.公司" || "$replace" == "*.公益" || "$replace" == "*.台湾" || "$replace" == "*.台灣" || "$replace" == "*.商城" || "$replace" == "*.商店" || "$replace" == "*.商标" || "$replace" == "*.嘉里" || "$replace" == "*.嘉里大酒店" || "$replace" == "*.在线" || "$replace" == "*.大众汽车" || "$replace" == "*.大拿" || "$replace" == "*.天主教" || "$replace" == "*.娱乐" || "$replace" == "*.家電" || "$replace" == "*.工行" || "$replace" == "*.广东" || "$replace" == "*.微博" || "$replace" == "*.慈善" || "$replace" == "*.我爱你" || "$replace" == "*.手机" || "$replace" == "*.手表" || "$replace" == "*.招聘" || "$replace" == "*.政务" || "$replace" == "*.政府" || "$replace" == "*.新加坡" || "$replace" == "*.新闻" || "$replace" == "*.时尚" || "$replace" == "*.書籍" || "$replace" == "*.机构" || "$replace" == "*.测试" || "$replace" == "*.淡马锡" || "$replace" == "*.測試" || "$replace" == "*.游戏" || "$replace" == "*.澳門" || "$replace" == "*.点看" || "$replace" == "*.珠宝" || "$replace" == "*.移动" || "$replace" == "*.组织机构" || "$replace" == "*.网址" || "$replace" == "*.网店" || "$replace" == "*.网站" || "$replace" == "*.网络" || "$replace" == "*.联通" || "$replace" == "*.诺基亚" || "$replace" == "*.谷歌" || "$replace" == "*.购物" || "$replace" == "*.通販" || "$replace" == "*.集团" || "$replace" == "*.電訊盈科" || "$replace" == "*.飞利浦" || "$replace" == "*.食品" || "$replace" == "*.餐厅" || "$replace" == "*.香格里拉" || "$replace" == "*.香港" || "$replace" == "*.닷넷" || "$replace" == "*.닷컴" || "$replace" == "*.삼성" || "$replace" == "*.테스트" || "$replace" == "*.한국" ]];
				then
					pterodactyl=$(<$filename)
					echo "${pterodactyl//$search/$replace}" > $filename

					pterodactyll=$(<$filename)
					echo "${pterodactyll//$search2/$replace2}" > $filename

					validdomain="valid"
				fi
			done

			if [[ "$usedlocation" != "/var/www/" ]];
			then
				echo "" | sudo tee -a "$filename2"
				echo "<Directory $usedlocation>" | sudo tee -a "$filename2"
				echo "	Options Indexes FollowSymLinks" | sudo tee -a "$filename2"
				echo "	AllowOverride All" | sudo tee -a "$filename2"
				echo "	Require all granted" | sudo tee -a "$filename2"
				echo "</Directory>" | sudo tee -a "$filename2"
			fi

			tput reset
			tput clear
			$info
			echo "Please fill in the following details regarding your ssl certificate"
			echo "It is advised to redirect all traffic to secure HTTPS."
			echo
			sudo certbot --apache
			$log
			sudo a2ensite pterodactyl.conf
			sudo a2dissite 000-default.conf
			sudo a2enmod rewrite
			sudo systemctl restart apache2
			$succeeded
			PWCdone="valid"
		else
			PWCdone="Invalid option"
		fi

		if [[ "$SSLMODE" == 2 ]];
		then
			$log
			## Unencrypted Method
			sudo curl -LOs "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Web%20and%20Pterodactyl%20Unofficial%20Installer%20(Debian)/nonssl/pterodactyl.conf"

			# Assign the filename
			filename="pterodactyl.conf"
			filename2="/etc/apache2/apache2.conf"
			public="pterodactyl/public"

			# Define searches
			search="<domain>"
			search2="<folder>"

			# Define replaces
			replace2="$usedlocation$public"

			while [[ "$validdomain" != "valid" ]];
			do
				# Let user define the domain
				$info
				echo "Make sure that your FQDN points to this server or else the installation will fail!"
				echo "You can do this by checking the DNS records if behind a proxy like cloudflare or if not by using 'ping FQDN'"
				echo
				echo
				echo "If you want to use the installation locally use localhost instead of 127.0.0.1"
				echo "This only applies to the FQDN and the MySQL database should (in case it's installed locally) still be configured using 127.0.0.1 to prevent issues with pterodactyl"
				$ask
				read -p "Please enter a valid FQDN: " replace
				$log

				if [[ "$replace" == "localhost" || "$replace" == "*.aaa" || "$replace" == "*.aarp" || "$replace" == "*.abarth" || "$replace" == "*.abb" || "$replace" == "*.abbott" || "$replace" == "*.abbvie" || "$replace" == "*.abc" || "$replace" == "*.able" || "$replace" == "*.abogado" || "$replace" == "*.abudhabi" || "$replace" == "*.ac" || "$replace" == "*.academy" || "$replace" == "*.accenture" || "$replace" == "*.accountant" || "$replace" == "*.accountants" || "$replace" == "*.aco" || "$replace" == "*.active" || "$replace" == "*.actor" || "$replace" == "*.ad" || "$replace" == "*.adac" || "$replace" == "*.ads" || "$replace" == "*.adult" || "$replace" == "*.ae" || "$replace" == "*.aeg" || "$replace" == "*.aero" || "$replace" == "*.aetna" || "$replace" == "*.af" || "$replace" == "*.afamilycompany" || "$replace" == "*.afl" || "$replace" == "*.africa" || "$replace" == "*.ag" || "$replace" == "*.agakhan" || "$replace" == "*.agency" || "$replace" == "*.ai" || "$replace" == "*.aig" || "$replace" == "*.aigo" || "$replace" == "*.airbus" || "$replace" == "*.airforce" || "$replace" == "*.airtel" || "$replace" == "*.akdn" || "$replace" == "*.al" || "$replace" == "*.alfaromeo" || "$replace" == "*.alibaba" || "$replace" == "*.alipay" || "$replace" == "*.allfinanz" || "$replace" == "*.allstate" || "$replace" == "*.ally" || "$replace" == "*.alsace" || "$replace" == "*.alstom" || "$replace" == "*.am" || "$replace" == "*.amazon" || "$replace" == "*.americanexpress" || "$replace" == "*.americanfamily" || "$replace" == "*.amex" || "$replace" == "*.amfam" || "$replace" == "*.amica" || "$replace" == "*.amsterdam" || "$replace" == "*.an" || "$replace" == "*.analytics" || "$replace" == "*.android" || "$replace" == "*.anquan" || "$replace" == "*.anz" || "$replace" == "*.ao" || "$replace" == "*.aol" || "$replace" == "*.apartments" || "$replace" == "*.app" || "$replace" == "*.apple" || "$replace" == "*.aq" || "$replace" == "*.aquarelle" || "$replace" == "*.ar" || "$replace" == "*.arab" || "$replace" == "*.aramco" || "$replace" == "*.archi" || "$replace" == "*.army" || "$replace" == "*.arpa" || "$replace" == "*.art" || "$replace" == "*.arte" || "$replace" == "*.as" || "$replace" == "*.asda" || "$replace" == "*.asia" || "$replace" == "*.associates" || "$replace" == "*.at" || "$replace" == "*.athleta" || "$replace" == "*.attorney" || "$replace" == "*.au" || "$replace" == "*.auction" || "$replace" == "*.audi" || "$replace" == "*.audible" || "$replace" == "*.audio" || "$replace" == "*.auspost" || "$replace" == "*.author" || "$replace" == "*.auto" || "$replace" == "*.autos" || "$replace" == "*.avianca" || "$replace" == "*.aw" || "$replace" == "*.aws" || "$replace" == "*.ax" || "$replace" == "*.axa" || "$replace" == "*.az" || "$replace" == "*.azure" || "$replace" == "*.ba" || "$replace" == "*.baby" || "$replace" == "*.baidu" || "$replace" == "*.banamex" || "$replace" == "*.bananarepublic" || "$replace" == "*.band" || "$replace" == "*.bank" || "$replace" == "*.bar" || "$replace" == "*.barcelona" || "$replace" == "*.barclaycard" || "$replace" == "*.barclays" || "$replace" == "*.barefoot" || "$replace" == "*.bargains" || "$replace" == "*.baseball" || "$replace" == "*.basketball" || "$replace" == "*.bauhaus" || "$replace" == "*.bayern" || "$replace" == "*.bb" || "$replace" == "*.bbc" || "$replace" == "*.bbt" || "$replace" == "*.bbva" || "$replace" == "*.bcg" || "$replace" == "*.bcn" || "$replace" == "*.bd" || "$replace" == "*.be" || "$replace" == "*.beats" || "$replace" == "*.beauty" || "$replace" == "*.beer" || "$replace" == "*.bentley" || "$replace" == "*.berlin" || "$replace" == "*.best" || "$replace" == "*.bestbuy" || "$replace" == "*.bet" || "$replace" == "*.bf" || "$replace" == "*.bg" || "$replace" == "*.bh" || "$replace" == "*.bharti" || "$replace" == "*.bi" || "$replace" == "*.bible" || "$replace" == "*.bid" || "$replace" == "*.bike" || "$replace" == "*.bing" || "$replace" == "*.bingo" || "$replace" == "*.bio" || "$replace" == "*.biz" || "$replace" == "*.bj" || "$replace" == "*.bl" || "$replace" == "*.black" || "$replace" == "*.blackfriday" || "$replace" == "*.blanco" || "$replace" == "*.blockbuster" || "$replace" == "*.blog" || "$replace" == "*.bloomberg" || "$replace" == "*.blue" || "$replace" == "*.bm" || "$replace" == "*.bms" || "$replace" == "*.bmw" || "$replace" == "*.bn" || "$replace" == "*.bnl" || "$replace" == "*.bnpparibas" || "$replace" == "*.bo" || "$replace" == "*.boats" || "$replace" == "*.boehringer" || "$replace" == "*.bofa" || "$replace" == "*.bom" || "$replace" == "*.bond" || "$replace" == "*.boo" || "$replace" == "*.book" || "$replace" == "*.booking" || "$replace" == "*.boots" || "$replace" == "*.bosch" || "$replace" == "*.bostik" || "$replace" == "*.boston" || "$replace" == "*.bot" || "$replace" == "*.boutique" || "$replace" == "*.box" || "$replace" == "*.bq" || "$replace" == "*.br" || "$replace" == "*.bradesco" || "$replace" == "*.bridgestone" || "$replace" == "*.broadway" || "$replace" == "*.broker" || "$replace" == "*.brother" || "$replace" == "*.brussels" || "$replace" == "*.bs" || "$replace" == "*.bt" || "$replace" == "*.budapest" || "$replace" == "*.bugatti" || "$replace" == "*.build" || "$replace" == "*.builders" || "$replace" == "*.business" || "$replace" == "*.buy" || "$replace" == "*.buzz" || "$replace" == "*.bv" || "$replace" == "*.bw" || "$replace" == "*.by" || "$replace" == "*.bz" || "$replace" == "*.bzh" || "$replace" == "*.ca" || "$replace" == "*.cab" || "$replace" == "*.cafe" || "$replace" == "*.cal" || "$replace" == "*.call" || "$replace" == "*.calvinklein" || "$replace" == "*.cam" || "$replace" == "*.camera" || "$replace" == "*.camp" || "$replace" == "*.cancerresearch" || "$replace" == "*.canon" || "$replace" == "*.capetown" || "$replace" == "*.capital" || "$replace" == "*.capitalone" || "$replace" == "*.car" || "$replace" == "*.caravan" || "$replace" == "*.cards" || "$replace" == "*.care" || "$replace" == "*.career" || "$replace" == "*.careers" || "$replace" == "*.cars" || "$replace" == "*.cartier" || "$replace" == "*.casa" || "$replace" == "*.case" || "$replace" == "*.caseih" || "$replace" == "*.cash" || "$replace" == "*.casino" || "$replace" == "*.cat" || "$replace" == "*.catering" || "$replace" == "*.catholic" || "$replace" == "*.cba" || "$replace" == "*.cbn" || "$replace" == "*.cbre" || "$replace" == "*.cbs" || "$replace" == "*.cc" || "$replace" == "*.cd" || "$replace" == "*.ceb" || "$replace" == "*.center" || "$replace" == "*.ceo" || "$replace" == "*.cern" || "$replace" == "*.cf" || "$replace" == "*.cfa" || "$replace" == "*.cfd" || "$replace" == "*.cg" || "$replace" == "*.ch" || "$replace" == "*.chanel" || "$replace" == "*.channel" || "$replace" == "*.charity" || "$replace" == "*.chase" || "$replace" == "*.chat" || "$replace" == "*.cheap" || "$replace" == "*.chintai" || "$replace" == "*.chloe" || "$replace" == "*.christmas" || "$replace" == "*.chrome" || "$replace" == "*.chrysler" || "$replace" == "*.church" || "$replace" == "*.ci" || "$replace" == "*.cipriani" || "$replace" == "*.circle" || "$replace" == "*.cisco" || "$replace" == "*.citadel" || "$replace" == "*.citi" || "$replace" == "*.citic" || "$replace" == "*.city" || "$replace" == "*.cityeats" || "$replace" == "*.ck" || "$replace" == "*.cl" || "$replace" == "*.claims" || "$replace" == "*.cleaning" || "$replace" == "*.click" || "$replace" == "*.clinic" || "$replace" == "*.clinique" || "$replace" == "*.clothing" || "$replace" == "*.cloud" || "$replace" == "*.club" || "$replace" == "*.clubmed" || "$replace" == "*.cm" || "$replace" == "*.cn" || "$replace" == "*.co" || "$replace" == "*.coach" || "$replace" == "*.codes" || "$replace" == "*.coffee" || "$replace" == "*.college" || "$replace" == "*.cologne" || "$replace" == "*.com" || "$replace" == "*.comcast" || "$replace" == "*.commbank" || "$replace" == "*.community" || "$replace" == "*.company" || "$replace" == "*.compare" || "$replace" == "*.computer" || "$replace" == "*.comsec" || "$replace" == "*.condos" || "$replace" == "*.construction" || "$replace" == "*.consulting" || "$replace" == "*.contact" || "$replace" == "*.contractors" || "$replace" == "*.cooking" || "$replace" == "*.cookingchannel" || "$replace" == "*.cool" || "$replace" == "*.coop" || "$replace" == "*.corsica" || "$replace" == "*.country" || "$replace" == "*.coupon" || "$replace" == "*.coupons" || "$replace" == "*.courses" || "$replace" == "*.cpa" || "$replace" == "*.cr" || "$replace" == "*.credit" || "$replace" == "*.creditcard" || "$replace" == "*.creditunion" || "$replace" == "*.cricket" || "$replace" == "*.crown" || "$replace" == "*.crs" || "$replace" == "*.cruise" || "$replace" == "*.cruises" || "$replace" == "*.csc" || "$replace" == "*.cu" || "$replace" == "*.cuisinella" || "$replace" == "*.cv" || "$replace" == "*.cw" || "$replace" == "*.cx" || "$replace" == "*.cy" || "$replace" == "*.cymru" || "$replace" == "*.cyou" || "$replace" == "*.cz" || "$replace" == "*.dabur" || "$replace" == "*.dad" || "$replace" == "*.dance" || "$replace" == "*.data" || "$replace" == "*.date" || "$replace" == "*.dating" || "$replace" == "*.datsun" || "$replace" == "*.day" || "$replace" == "*.dclk" || "$replace" == "*.dds" || "$replace" == "*.de" || "$replace" == "*.deal" || "$replace" == "*.dealer" || "$replace" == "*.deals" || "$replace" == "*.degree" || "$replace" == "*.delivery" || "$replace" == "*.dell" || "$replace" == "*.deloitte" || "$replace" == "*.delta" || "$replace" == "*.democrat" || "$replace" == "*.dental" || "$replace" == "*.dentist" || "$replace" == "*.desi" || "$replace" == "*.design" || "$replace" == "*.dev" || "$replace" == "*.dhl" || "$replace" == "*.diamonds" || "$replace" == "*.diet" || "$replace" == "*.digital" || "$replace" == "*.direct" || "$replace" == "*.directory" || "$replace" == "*.discount" || "$replace" == "*.discover" || "$replace" == "*.dish" || "$replace" == "*.diy" || "$replace" == "*.dj" || "$replace" == "*.dk" || "$replace" == "*.dm" || "$replace" == "*.dnp" || "$replace" == "*.do" || "$replace" == "*.docs" || "$replace" == "*.doctor" || "$replace" == "*.dodge" || "$replace" == "*.dog" || "$replace" == "*.doha" || "$replace" == "*.domains" || "$replace" == "*.doosan" || "$replace" == "*.dot" || "$replace" == "*.download" || "$replace" == "*.drive" || "$replace" == "*.dtv" || "$replace" == "*.dubai" || "$replace" == "*.duck" || "$replace" == "*.dunlop" || "$replace" == "*.duns" || "$replace" == "*.dupont" || "$replace" == "*.durban" || "$replace" == "*.dvag" || "$replace" == "*.dvr" || "$replace" == "*.dz" || "$replace" == "*.earth" || "$replace" == "*.eat" || "$replace" == "*.ec" || "$replace" == "*.eco" || "$replace" == "*.edeka" || "$replace" == "*.edu" || "$replace" == "*.education" || "$replace" == "*.ee" || "$replace" == "*.eg" || "$replace" == "*.eh" || "$replace" == "*.email" || "$replace" == "*.emerck" || "$replace" == "*.energy" || "$replace" == "*.engineer" || "$replace" == "*.engineering" || "$replace" == "*.enterprises" || "$replace" == "*.epost" || "$replace" == "*.epson" || "$replace" == "*.equipment" || "$replace" == "*.er" || "$replace" == "*.ericsson" || "$replace" == "*.erni" || "$replace" == "*.es" || "$replace" == "*.esq" || "$replace" == "*.estate" || "$replace" == "*.esurance" || "$replace" == "*.et" || "$replace" == "*.etisalat" || "$replace" == "*.eu" || "$replace" == "*.eurovision" || "$replace" == "*.eus" || "$replace" == "*.events" || "$replace" == "*.everbank" || "$replace" == "*.exchange" || "$replace" == "*.expert" || "$replace" == "*.exposed" || "$replace" == "*.express" || "$replace" == "*.extraspace" || "$replace" == "*.fage" || "$replace" == "*.fail" || "$replace" == "*.fairwinds" || "$replace" == "*.faith" || "$replace" == "*.family" || "$replace" == "*.fan" || "$replace" == "*.fans" || "$replace" == "*.farm" || "$replace" == "*.farmers" || "$replace" == "*.fashion" || "$replace" == "*.fast" || "$replace" == "*.fedex" || "$replace" == "*.feedback" || "$replace" == "*.ferrari" || "$replace" == "*.ferrero" || "$replace" == "*.fi" || "$replace" == "*.fiat" || "$replace" == "*.fidelity" || "$replace" == "*.fido" || "$replace" == "*.film" || "$replace" == "*.final" || "$replace" == "*.finance" || "$replace" == "*.financial" || "$replace" == "*.fire" || "$replace" == "*.firestone" || "$replace" == "*.firmdale" || "$replace" == "*.fish" || "$replace" == "*.fishing" || "$replace" == "*.fit" || "$replace" == "*.fitness" || "$replace" == "*.fj" || "$replace" == "*.fk" || "$replace" == "*.flickr" || "$replace" == "*.flights" || "$replace" == "*.flir" || "$replace" == "*.florist" || "$replace" == "*.flowers" || "$replace" == "*.flsmidth" || "$replace" == "*.fly" || "$replace" == "*.fm" || "$replace" == "*.fo" || "$replace" == "*.foo" || "$replace" == "*.food" || "$replace" == "*.foodnetwork" || "$replace" == "*.football" || "$replace" == "*.ford" || "$replace" == "*.forex" || "$replace" == "*.forsale" || "$replace" == "*.forum" || "$replace" == "*.foundation" || "$replace" == "*.fox" || "$replace" == "*.fr" || "$replace" == "*.free" || "$replace" == "*.fresenius" || "$replace" == "*.frl" || "$replace" == "*.frogans" || "$replace" == "*.frontdoor" || "$replace" == "*.frontier" || "$replace" == "*.ftr" || "$replace" == "*.fujitsu" || "$replace" == "*.fujixerox" || "$replace" == "*.fun" || "$replace" == "*.fund" || "$replace" == "*.furniture" || "$replace" == "*.futbol" || "$replace" == "*.fyi" || "$replace" == "*.ga" || "$replace" == "*.gal" || "$replace" == "*.gallery" || "$replace" == "*.gallo" || "$replace" == "*.gallup" || "$replace" == "*.game" || "$replace" == "*.games" || "$replace" == "*.gap" || "$replace" == "*.garden" || "$replace" == "*.gay" || "$replace" == "*.gb" || "$replace" == "*.gbiz" || "$replace" == "*.gd" || "$replace" == "*.gdn" || "$replace" == "*.ge" || "$replace" == "*.gea" || "$replace" == "*.gent" || "$replace" == "*.genting" || "$replace" == "*.george" || "$replace" == "*.gf" || "$replace" == "*.gg" || "$replace" == "*.ggee" || "$replace" == "*.gh" || "$replace" == "*.gi" || "$replace" == "*.gift" || "$replace" == "*.gifts" || "$replace" == "*.gives" || "$replace" == "*.giving" || "$replace" == "*.gl" || "$replace" == "*.glade" || "$replace" == "*.glass" || "$replace" == "*.gle" || "$replace" == "*.global" || "$replace" == "*.globo" || "$replace" == "*.gm" || "$replace" == "*.gmail" || "$replace" == "*.gmbh" || "$replace" == "*.gmo" || "$replace" == "*.gmx" || "$replace" == "*.gn" || "$replace" == "*.godaddy" || "$replace" == "*.gold" || "$replace" == "*.goldpoint" || "$replace" == "*.golf" || "$replace" == "*.goo" || "$replace" == "*.goodhands" || "$replace" == "*.goodyear" || "$replace" == "*.goog" || "$replace" == "*.google" || "$replace" == "*.gop" || "$replace" == "*.got" || "$replace" == "*.gov" || "$replace" == "*.gp" || "$replace" == "*.gq" || "$replace" == "*.gr" || "$replace" == "*.grainger" || "$replace" == "*.graphics" || "$replace" == "*.gratis" || "$replace" == "*.green" || "$replace" == "*.gripe" || "$replace" == "*.grocery" || "$replace" == "*.group" || "$replace" == "*.gs" || "$replace" == "*.gt" || "$replace" == "*.gu" || "$replace" == "*.guardian" || "$replace" == "*.gucci" || "$replace" == "*.guge" || "$replace" == "*.guide" || "$replace" == "*.guitars" || "$replace" == "*.guru" || "$replace" == "*.gw" || "$replace" == "*.gy" || "$replace" == "*.hair" || "$replace" == "*.hamburg" || "$replace" == "*.hangout" || "$replace" == "*.haus" || "$replace" == "*.hbo" || "$replace" == "*.hdfc" || "$replace" == "*.hdfcbank" || "$replace" == "*.health" || "$replace" == "*.healthcare" || "$replace" == "*.help" || "$replace" == "*.helsinki" || "$replace" == "*.here" || "$replace" == "*.hermes" || "$replace" == "*.hgtv" || "$replace" == "*.hiphop" || "$replace" == "*.hisamitsu" || "$replace" == "*.hitachi" || "$replace" == "*.hiv" || "$replace" == "*.hk" || "$replace" == "*.hkt" || "$replace" == "*.hm" || "$replace" == "*.hn" || "$replace" == "*.hockey" || "$replace" == "*.holdings" || "$replace" == "*.holiday" || "$replace" == "*.homedepot" || "$replace" == "*.homegoods" || "$replace" == "*.homes" || "$replace" == "*.homesense" || "$replace" == "*.honda" || "$replace" == "*.honeywell" || "$replace" == "*.horse" || "$replace" == "*.hospital" || "$replace" == "*.host" || "$replace" == "*.hosting" || "$replace" == "*.hot" || "$replace" == "*.hoteles" || "$replace" == "*.hotels" || "$replace" == "*.hotmail" || "$replace" == "*.house" || "$replace" == "*.how" || "$replace" == "*.hr" || "$replace" == "*.hsbc" || "$replace" == "*.ht" || "$replace" == "*.htc" || "$replace" == "*.hu" || "$replace" == "*.hughes" || "$replace" == "*.hyatt" || "$replace" == "*.hyundai" || "$replace" == "*.ibm" || "$replace" == "*.icbc" || "$replace" == "*.ice" || "$replace" == "*.icu" || "$replace" == "*.id" || "$replace" == "*.ie" || "$replace" == "*.ieee" || "$replace" == "*.ifm" || "$replace" == "*.iinet" || "$replace" == "*.ikano" || "$replace" == "*.il" || "$replace" == "*.im" || "$replace" == "*.imamat" || "$replace" == "*.imdb" || "$replace" == "*.immo" || "$replace" == "*.immobilien" || "$replace" == "*.in" || "$replace" == "*.inc" || "$replace" == "*.industries" || "$replace" == "*.infiniti" || "$replace" == "*.info" || "$replace" == "*.ing" || "$replace" == "*.ink" || "$replace" == "*.institute" || "$replace" == "*.insurance" || "$replace" == "*.insure" || "$replace" == "*.int" || "$replace" == "*.intel" || "$replace" == "*.international" || "$replace" == "*.intuit" || "$replace" == "*.investments" || "$replace" == "*.io" || "$replace" == "*.ipiranga" || "$replace" == "*.iq" || "$replace" == "*.ir" || "$replace" == "*.irish" || "$replace" == "*.is" || "$replace" == "*.iselect" || "$replace" == "*.ismaili" || "$replace" == "*.ist" || "$replace" == "*.istanbul" || "$replace" == "*.it" || "$replace" == "*.itau" || "$replace" == "*.itv" || "$replace" == "*.iveco" || "$replace" == "*.iwc" || "$replace" == "*.jaguar" || "$replace" == "*.java" || "$replace" == "*.jcb" || "$replace" == "*.jcp" || "$replace" == "*.je" || "$replace" == "*.jeep" || "$replace" == "*.jetzt" || "$replace" == "*.jewelry" || "$replace" == "*.jio" || "$replace" == "*.jlc" || "$replace" == "*.jll" || "$replace" == "*.jm" || "$replace" == "*.jmp" || "$replace" == "*.jnj" || "$replace" == "*.jo" || "$replace" == "*.jobs" || "$replace" == "*.joburg" || "$replace" == "*.jot" || "$replace" == "*.joy" || "$replace" == "*.jp" || "$replace" == "*.jpmorgan" || "$replace" == "*.jprs" || "$replace" == "*.juegos" || "$replace" == "*.juniper" || "$replace" == "*.kaufen" || "$replace" == "*.kddi" || "$replace" == "*.ke" || "$replace" == "*.kerryhotels" || "$replace" == "*.kerrylogistics" || "$replace" == "*.kerryproperties" || "$replace" == "*.kfh" || "$replace" == "*.kg" || "$replace" == "*.kh" || "$replace" == "*.ki" || "$replace" == "*.kia" || "$replace" == "*.kim" || "$replace" == "*.kinder" || "$replace" == "*.kindle" || "$replace" == "*.kitchen" || "$replace" == "*.kiwi" || "$replace" == "*.km" || "$replace" == "*.kn" || "$replace" == "*.koeln" || "$replace" == "*.komatsu" || "$replace" == "*.kosher" || "$replace" == "*.kp" || "$replace" == "*.kpmg" || "$replace" == "*.kpn" || "$replace" == "*.kr" || "$replace" == "*.krd" || "$replace" == "*.kred" || "$replace" == "*.kuokgroup" || "$replace" == "*.kw" || "$replace" == "*.ky" || "$replace" == "*.kyoto" || "$replace" == "*.kz" || "$replace" == "*.la" || "$replace" == "*.lacaixa" || "$replace" == "*.ladbrokes" || "$replace" == "*.lamborghini" || "$replace" == "*.lamer" || "$replace" == "*.lancaster" || "$replace" == "*.lancia" || "$replace" == "*.lancome" || "$replace" == "*.land" || "$replace" == "*.landrover" || "$replace" == "*.lanxess" || "$replace" == "*.lasalle" || "$replace" == "*.lat" || "$replace" == "*.latino" || "$replace" == "*.latrobe" || "$replace" == "*.law" || "$replace" == "*.lawyer" || "$replace" == "*.lb" || "$replace" == "*.lc" || "$replace" == "*.lds" || "$replace" == "*.lease" || "$replace" == "*.leclerc" || "$replace" == "*.lefrak" || "$replace" == "*.legal" || "$replace" == "*.lego" || "$replace" == "*.lexus" || "$replace" == "*.lgbt" || "$replace" == "*.li" || "$replace" == "*.liaison" || "$replace" == "*.lidl" || "$replace" == "*.life" || "$replace" == "*.lifeinsurance" || "$replace" == "*.lifestyle" || "$replace" == "*.lighting" || "$replace" == "*.like" || "$replace" == "*.lilly" || "$replace" == "*.limited" || "$replace" == "*.limo" || "$replace" == "*.lincoln" || "$replace" == "*.linde" || "$replace" == "*.link" || "$replace" == "*.lipsy" || "$replace" == "*.live" || "$replace" == "*.living" || "$replace" == "*.lixil" || "$replace" == "*.lk" || "$replace" == "*.llc" || "$replace" == "*.llp" || "$replace" == "*.loan" || "$replace" == "*.loans" || "$replace" == "*.locker" || "$replace" == "*.locus" || "$replace" == "*.loft" || "$replace" == "*.lol" || "$replace" == "*.london" || "$replace" == "*.lotte" || "$replace" == "*.lotto" || "$replace" == "*.love" || "$replace" == "*.lpl" || "$replace" == "*.lplfinancial" || "$replace" == "*.lr" || "$replace" == "*.ls" || "$replace" == "*.lt" || "$replace" == "*.ltd" || "$replace" == "*.ltda" || "$replace" == "*.lu" || "$replace" == "*.lundbeck" || "$replace" == "*.lupin" || "$replace" == "*.luxe" || "$replace" == "*.luxury" || "$replace" == "*.lv" || "$replace" == "*.ma" || "$replace" == "*.macys" || "$replace" == "*.madrid" || "$replace" == "*.maif" || "$replace" == "*.maison" || "$replace" == "*.makeup" || "$replace" == "*.man" || "$replace" == "*.management" || "$replace" == "*.mango" || "$replace" == "*.map" || "$replace" == "*.market" || "$replace" == "*.marketing" || "$replace" == "*.markets" || "$replace" == "*.marriott" || "$replace" == "*.marshalls" || "$replace" == "*.maserati" || "$replace" == "*.mattel" || "$replace" == "*.mba" || "$replace" == "*.mc" || "$replace" == "*.mcd" || "$replace" == "*.mcdonalds" || "$replace" == "*.mckinsey" || "$replace" == "*.md" || "$replace" == "*.me" || "$replace" == "*.med" || "$replace" == "*.media" || "$replace" == "*.meet" || "$replace" == "*.melbourne" || "$replace" == "*.meme" || "$replace" == "*.memorial" || "$replace" == "*.men" || "$replace" == "*.menu" || "$replace" == "*.meo" || "$replace" == "*.merckmsd" || "$replace" == "*.metlife" || "$replace" == "*.mf" || "$replace" == "*.mg" || "$replace" == "*.mh" || "$replace" == "*.miami" || "$replace" == "*.microsoft" || "$replace" == "*.mil" || "$replace" == "*.mini" || "$replace" == "*.mint" || "$replace" == "*.mit" || "$replace" == "*.mitsubishi" || "$replace" == "*.mk" || "$replace" == "*.ml" || "$replace" == "*.mlb" || "$replace" == "*.mls" || "$replace" == "*.mm" || "$replace" == "*.mma" || "$replace" == "*.mn" || "$replace" == "*.mo" || "$replace" == "*.mobi" || "$replace" == "*.mobile" || "$replace" == "*.mobily" || "$replace" == "*.moda" || "$replace" == "*.moe" || "$replace" == "*.moi" || "$replace" == "*.mom" || "$replace" == "*.monash" || "$replace" == "*.money" || "$replace" == "*.monster" || "$replace" == "*.montblanc" || "$replace" == "*.mopar" || "$replace" == "*.mormon" || "$replace" == "*.mortgage" || "$replace" == "*.moscow" || "$replace" == "*.moto" || "$replace" == "*.motorcycles" || "$replace" == "*.mov" || "$replace" == "*.movie" || "$replace" == "*.movistar" || "$replace" == "*.mp" || "$replace" == "*.mq" || "$replace" == "*.mr" || "$replace" == "*.ms" || "$replace" == "*.msd" || "$replace" == "*.mt" || "$replace" == "*.mtn" || "$replace" == "*.mtpc" || "$replace" == "*.mtr" || "$replace" == "*.mu" || "$replace" == "*.museum" || "$replace" == "*.mutual" || "$replace" == "*.mutuelle" || "$replace" == "*.mv" || "$replace" == "*.mw" || "$replace" == "*.mx" || "$replace" == "*.my" || "$replace" == "*.mz" || "$replace" == "*.na" || "$replace" == "*.nab" || "$replace" == "*.nadex" || "$replace" == "*.nagoya" || "$replace" == "*.name" || "$replace" == "*.nationwide" || "$replace" == "*.natura" || "$replace" == "*.navy" || "$replace" == "*.nba" || "$replace" == "*.nc" || "$replace" == "*.ne" || "$replace" == "*.nec" || "$replace" == "*.net" || "$replace" == "*.netbank" || "$replace" == "*.netflix" || "$replace" == "*.network" || "$replace" == "*.neustar" || "$replace" == "*.new" || "$replace" == "*.newholland" || "$replace" == "*.news" || "$replace" == "*.next" || "$replace" == "*.nextdirect" || "$replace" == "*.nexus" || "$replace" == "*.nf" || "$replace" == "*.nfl" || "$replace" == "*.ng" || "$replace" == "*.ngo" || "$replace" == "*.nhk" || "$replace" == "*.ni" || "$replace" == "*.nico" || "$replace" == "*.nike" || "$replace" == "*.nikon" || "$replace" == "*.ninja" || "$replace" == "*.nissan" || "$replace" == "*.nissay" || "$replace" == "*.nl" || "$replace" == "*.no" || "$replace" == "*.nokia" || "$replace" == "*.northwesternmutual" || "$replace" == "*.norton" || "$replace" == "*.now" || "$replace" == "*.nowruz" || "$replace" == "*.nowtv" || "$replace" == "*.np" || "$replace" == "*.nr" || "$replace" == "*.nra" || "$replace" == "*.nrw" || "$replace" == "*.ntt" || "$replace" == "*.nu" || "$replace" == "*.nyc" || "$replace" == "*.nz" || "$replace" == "*.obi" || "$replace" == "*.observer" || "$replace" == "*.off" || "$replace" == "*.office" || "$replace" == "*.okinawa" || "$replace" == "*.olayan" || "$replace" == "*.olayangroup" || "$replace" == "*.oldnavy" || "$replace" == "*.ollo" || "$replace" == "*.om" || "$replace" == "*.omega" || "$replace" == "*.one" || "$replace" == "*.ong" || "$replace" == "*.onl" || "$replace" == "*.online" || "$replace" == "*.onyourside" || "$replace" == "*.ooo" || "$replace" == "*.open" || "$replace" == "*.oracle" || "$replace" == "*.orange" || "$replace" == "*.org" || "$replace" == "*.organic" || "$replace" == "*.orientexpress" || "$replace" == "*.origins" || "$replace" == "*.osaka" || "$replace" == "*.otsuka" || "$replace" == "*.ott" || "$replace" == "*.ovh" || "$replace" == "*.pa" || "$replace" == "*.page" || "$replace" == "*.pamperedchef" || "$replace" == "*.panasonic" || "$replace" == "*.panerai" || "$replace" == "*.paris" || "$replace" == "*.pars" || "$replace" == "*.partners" || "$replace" == "*.parts" || "$replace" == "*.party" || "$replace" == "*.passagens" || "$replace" == "*.pay" || "$replace" == "*.pccw" || "$replace" == "*.pe" || "$replace" == "*.pet" || "$replace" == "*.pf" || "$replace" == "*.pfizer" || "$replace" == "*.pg" || "$replace" == "*.ph" || "$replace" == "*.pharmacy" || "$replace" == "*.phd" || "$replace" == "*.philips" || "$replace" == "*.phone" || "$replace" == "*.photo" || "$replace" == "*.photography" || "$replace" == "*.photos" || "$replace" == "*.physio" || "$replace" == "*.piaget" || "$replace" == "*.pics" || "$replace" == "*.pictet" || "$replace" == "*.pictures" || "$replace" == "*.pid" || "$replace" == "*.pin" || "$replace" == "*.ping" || "$replace" == "*.pink" || "$replace" == "*.pioneer" || "$replace" == "*.pizza" || "$replace" == "*.pk" || "$replace" == "*.pl" || "$replace" == "*.place" || "$replace" == "*.play" || "$replace" == "*.playstation" || "$replace" == "*.plumbing" || "$replace" == "*.plus" || "$replace" == "*.pm" || "$replace" == "*.pn" || "$replace" == "*.pnc" || "$replace" == "*.pohl" || "$replace" == "*.poker" || "$replace" == "*.politie" || "$replace" == "*.porn" || "$replace" == "*.post" || "$replace" == "*.pr" || "$replace" == "*.pramerica" || "$replace" == "*.praxi" || "$replace" == "*.press" || "$replace" == "*.prime" || "$replace" == "*.pro" || "$replace" == "*.prod" || "$replace" == "*.productions" || "$replace" == "*.prof" || "$replace" == "*.progressive" || "$replace" == "*.promo" || "$replace" == "*.properties" || "$replace" == "*.property" || "$replace" == "*.protection" || "$replace" == "*.pru" || "$replace" == "*.prudential" || "$replace" == "*.ps" || "$replace" == "*.pt" || "$replace" == "*.pub" || "$replace" == "*.pw" || "$replace" == "*.pwc" || "$replace" == "*.py" || "$replace" == "*.qa" || "$replace" == "*.qpon" || "$replace" == "*.quebec" || "$replace" == "*.quest" || "$replace" == "*.qvc" || "$replace" == "*.racing" || "$replace" == "*.radio" || "$replace" == "*.raid" || "$replace" == "*.re" || "$replace" == "*.read" || "$replace" == "*.realestate" || "$replace" == "*.realtor" || "$replace" == "*.realty" || "$replace" == "*.recipes" || "$replace" == "*.red" || "$replace" == "*.redstone" || "$replace" == "*.redumbrella" || "$replace" == "*.rehab" || "$replace" == "*.reise" || "$replace" == "*.reisen" || "$replace" == "*.reit" || "$replace" == "*.reliance" || "$replace" == "*.ren" || "$replace" == "*.rent" || "$replace" == "*.rentals" || "$replace" == "*.repair" || "$replace" == "*.report" || "$replace" == "*.republican" || "$replace" == "*.rest" || "$replace" == "*.restaurant" || "$replace" == "*.review" || "$replace" == "*.reviews" || "$replace" == "*.rexroth" || "$replace" == "*.rich" || "$replace" == "*.richardli" || "$replace" == "*.ricoh" || "$replace" == "*.rightathome" || "$replace" == "*.ril" || "$replace" == "*.rio" || "$replace" == "*.rip" || "$replace" == "*.rmit" || "$replace" == "*.ro" || "$replace" == "*.rocher" || "$replace" == "*.rocks" || "$replace" == "*.rodeo" || "$replace" == "*.rogers" || "$replace" == "*.room" || "$replace" == "*.rs" || "$replace" == "*.rsvp" || "$replace" == "*.ru" || "$replace" == "*.rugby" || "$replace" == "*.ruhr" || "$replace" == "*.run" || "$replace" == "*.rw" || "$replace" == "*.rwe" || "$replace" == "*.ryukyu" || "$replace" == "*.sa" || "$replace" == "*.saarland" || "$replace" == "*.safe" || "$replace" == "*.safety" || "$replace" == "*.sakura" || "$replace" == "*.sale" || "$replace" == "*.salon" || "$replace" == "*.samsclub" || "$replace" == "*.samsung" || "$replace" == "*.sandvik" || "$replace" == "*.sandvikcoromant" || "$replace" == "*.sanofi" || "$replace" == "*.sap" || "$replace" == "*.sapo" || "$replace" == "*.sarl" || "$replace" == "*.sas" || "$replace" == "*.save" || "$replace" == "*.saxo" || "$replace" == "*.sb" || "$replace" == "*.sbi" || "$replace" == "*.sbs" || "$replace" == "*.sc" || "$replace" == "*.sca" || "$replace" == "*.scb" || "$replace" == "*.schaeffler" || "$replace" == "*.schmidt" || "$replace" == "*.scholarships" || "$replace" == "*.school" || "$replace" == "*.schule" || "$replace" == "*.schwarz" || "$replace" == "*.science" || "$replace" == "*.scjohnson" || "$replace" == "*.scor" || "$replace" == "*.scot" || "$replace" == "*.sd" || "$replace" == "*.se" || "$replace" == "*.search" || "$replace" == "*.seat" || "$replace" == "*.secure" || "$replace" == "*.security" || "$replace" == "*.seek" || "$replace" == "*.select" || "$replace" == "*.sener" || "$replace" == "*.services" || "$replace" == "*.ses" || "$replace" == "*.seven" || "$replace" == "*.sew" || "$replace" == "*.sex" || "$replace" == "*.sexy" || "$replace" == "*.sfr" || "$replace" == "*.sg" || "$replace" == "*.sh" || "$replace" == "*.shangrila" || "$replace" == "*.sharp" || "$replace" == "*.shaw" || "$replace" == "*.shell" || "$replace" == "*.shia" || "$replace" == "*.shiksha" || "$replace" == "*.shoes" || "$replace" == "*.shop" || "$replace" == "*.shopping" || "$replace" == "*.shouji" || "$replace" == "*.show" || "$replace" == "*.showtime" || "$replace" == "*.shriram" || "$replace" == "*.si" || "$replace" == "*.silk" || "$replace" == "*.sina" || "$replace" == "*.singles" || "$replace" == "*.site" || "$replace" == "*.sj" || "$replace" == "*.sk" || "$replace" == "*.ski" || "$replace" == "*.skin" || "$replace" == "*.sky" || "$replace" == "*.skype" || "$replace" == "*.sl" || "$replace" == "*.sling" || "$replace" == "*.sm" || "$replace" == "*.smart" || "$replace" == "*.smile" || "$replace" == "*.sn" || "$replace" == "*.sncf" || "$replace" == "*.so" || "$replace" == "*.soccer" || "$replace" == "*.social" || "$replace" == "*.softbank" || "$replace" == "*.software" || "$replace" == "*.sohu" || "$replace" == "*.solar" || "$replace" == "*.solutions" || "$replace" == "*.song" || "$replace" == "*.sony" || "$replace" == "*.soy" || "$replace" == "*.spa" || "$replace" == "*.space" || "$replace" == "*.spiegel" || "$replace" == "*.sport" || "$replace" == "*.spot" || "$replace" == "*.spreadbetting" || "$replace" == "*.sr" || "$replace" == "*.srl" || "$replace" == "*.srt" || "$replace" == "*.ss" || "$replace" == "*.st" || "$replace" == "*.stada" || "$replace" == "*.staples" || "$replace" == "*.star" || "$replace" == "*.starhub" || "$replace" == "*.statebank" || "$replace" == "*.statefarm" || "$replace" == "*.statoil" || "$replace" == "*.stc" || "$replace" == "*.stcgroup" || "$replace" == "*.stockholm" || "$replace" == "*.storage" || "$replace" == "*.store" || "$replace" == "*.stream" || "$replace" == "*.studio" || "$replace" == "*.study" || "$replace" == "*.style" || "$replace" == "*.su" || "$replace" == "*.sucks" || "$replace" == "*.supplies" || "$replace" == "*.supply" || "$replace" == "*.support" || "$replace" == "*.surf" || "$replace" == "*.surgery" || "$replace" == "*.suzuki" || "$replace" == "*.sv" || "$replace" == "*.swatch" || "$replace" == "*.swiftcover" || "$replace" == "*.swiss" || "$replace" == "*.sx" || "$replace" == "*.sy" || "$replace" == "*.sydney" || "$replace" == "*.symantec" || "$replace" == "*.systems" || "$replace" == "*.sz" || "$replace" == "*.tab" || "$replace" == "*.taipei" || "$replace" == "*.talk" || "$replace" == "*.taobao" || "$replace" == "*.target" || "$replace" == "*.tatamotors" || "$replace" == "*.tatar" || "$replace" == "*.tattoo" || "$replace" == "*.tax" || "$replace" == "*.taxi" || "$replace" == "*.tc" || "$replace" == "*.tci" || "$replace" == "*.td" || "$replace" == "*.tdk" || "$replace" == "*.team" || "$replace" == "*.tech" || "$replace" == "*.technology" || "$replace" == "*.tel" || "$replace" == "*.telecity" || "$replace" == "*.telefonica" || "$replace" == "*.temasek" || "$replace" == "*.tennis" || "$replace" == "*.teva" || "$replace" == "*.tf" || "$replace" == "*.tg" || "$replace" == "*.th" || "$replace" == "*.thd" || "$replace" == "*.theater" || "$replace" == "*.theatre" || "$replace" == "*.tiaa" || "$replace" == "*.tickets" || "$replace" == "*.tienda" || "$replace" == "*.tiffany" || "$replace" == "*.tips" || "$replace" == "*.tires" || "$replace" == "*.tirol" || "$replace" == "*.tj" || "$replace" == "*.tjmaxx" || "$replace" == "*.tjx" || "$replace" == "*.tk" || "$replace" == "*.tkmaxx" || "$replace" == "*.tl" || "$replace" == "*.tm" || "$replace" == "*.tmall" || "$replace" == "*.tn" || "$replace" == "*.to" || "$replace" == "*.today" || "$replace" == "*.tokyo" || "$replace" == "*.tools" || "$replace" == "*.top" || "$replace" == "*.toray" || "$replace" == "*.toshiba" || "$replace" == "*.total" || "$replace" == "*.tours" || "$replace" == "*.town" || "$replace" == "*.toyota" || "$replace" == "*.toys" || "$replace" == "*.tp" || "$replace" == "*.tr" || "$replace" == "*.trade" || "$replace" == "*.trading" || "$replace" == "*.training" || "$replace" == "*.travel" || "$replace" == "*.travelchannel" || "$replace" == "*.travelers" || "$replace" == "*.travelersinsurance" || "$replace" == "*.trust" || "$replace" == "*.trv" || "$replace" == "*.tt" || "$replace" == "*.tube" || "$replace" == "*.tui" || "$replace" == "*.tunes" || "$replace" == "*.tushu" || "$replace" == "*.tv" || "$replace" == "*.tvs" || "$replace" == "*.tw" || "$replace" == "*.tz" || "$replace" == "*.ua" || "$replace" == "*.ubank" || "$replace" == "*.ubs" || "$replace" == "*.uconnect" || "$replace" == "*.ug" || "$replace" == "*.uk" || "$replace" == "*.um" || "$replace" == "*.unicom" || "$replace" == "*.university" || "$replace" == "*.uno" || "$replace" == "*.uol" || "$replace" == "*.ups" || "$replace" == "*.us" || "$replace" == "*.uy" || "$replace" == "*.uz" || "$replace" == "*.va" || "$replace" == "*.vacations" || "$replace" == "*.vana" || "$replace" == "*.vanguard" || "$replace" == "*.vc" || "$replace" == "*.ve" || "$replace" == "*.vegas" || "$replace" == "*.ventures" || "$replace" == "*.verisign" || "$replace" == "*.vermögensberater" || "$replace" == "*.vermögensberatung" || "$replace" == "*.versicherung" || "$replace" == "*.vet" || "$replace" == "*.vg" || "$replace" == "*.vi" || "$replace" == "*.viajes" || "$replace" == "*.video" || "$replace" == "*.vig" || "$replace" == "*.viking" || "$replace" == "*.villas" || "$replace" == "*.vin" || "$replace" == "*.vip" || "$replace" == "*.virgin" || "$replace" == "*.visa" || "$replace" == "*.vision" || "$replace" == "*.vista" || "$replace" == "*.vistaprint" || "$replace" == "*.viva" || "$replace" == "*.vivo" || "$replace" == "*.vlaanderen" || "$replace" == "*.vn" || "$replace" == "*.vodka" || "$replace" == "*.volkswagen" || "$replace" == "*.volvo" || "$replace" == "*.vote" || "$replace" == "*.voting" || "$replace" == "*.voto" || "$replace" == "*.voyage" || "$replace" == "*.vu" || "$replace" == "*.vuelos" || "$replace" == "*.wales" || "$replace" == "*.walmart" || "$replace" == "*.walter" || "$replace" == "*.wang" || "$replace" == "*.wanggou" || "$replace" == "*.warman" || "$replace" == "*.watch" || "$replace" == "*.watches" || "$replace" == "*.weather" || "$replace" == "*.weatherchannel" || "$replace" == "*.webcam" || "$replace" == "*.weber" || "$replace" == "*.website" || "$replace" == "*.wed" || "$replace" == "*.wedding" || "$replace" == "*.weibo" || "$replace" == "*.weir" || "$replace" == "*.wf" || "$replace" == "*.whoswho" || "$replace" == "*.wien" || "$replace" == "*.wiki" || "$replace" == "*.williamhill" || "$replace" == "*.win" || "$replace" == "*.windows" || "$replace" == "*.wine" || "$replace" == "*.winners" || "$replace" == "*.wme" || "$replace" == "*.wolterskluwer" || "$replace" == "*.woodside" || "$replace" == "*.work" || "$replace" == "*.works" || "$replace" == "*.world" || "$replace" == "*.wow" || "$replace" == "*.ws" || "$replace" == "*.wtc" || "$replace" == "*.wtf" || "$replace" == "*.xbox" || "$replace" == "*.xerox" || "$replace" == "*.xfinity" || "$replace" == "*.xihuan" || "$replace" == "*.xin" || "$replace" == "*.xperia" || "$replace" == "*.xxx" || "$replace" == "*.xyz" || "$replace" == "*.yachts" || "$replace" == "*.yahoo" || "$replace" == "*.yamaxun" || "$replace" == "*.yandex" || "$replace" == "*.ye" || "$replace" == "*.yodobashi" || "$replace" == "*.yoga" || "$replace" == "*.yokohama" || "$replace" == "*.you" || "$replace" == "*.youtube" || "$replace" == "*.yt" || "$replace" == "*.yun" || "$replace" == "*.za" || "$replace" == "*.zappos" || "$replace" == "*.zara" || "$replace" == "*.zero" || "$replace" == "*.zip" || "$replace" == "*.zippo" || "$replace" == "*.zm" || "$replace" == "*.zone" || "$replace" == "*.zuerich" || "$replace" == "*.zw" || "$replace" == "*.δοκιμή" || "$replace" == "*.ελ" || "$replace" == "*.ευ" || "$replace" == "*.бг" || "$replace" == "*.бел" || "$replace" == "*.дети" || "$replace" == "*.ею" || "$replace" == "*.испытание" || "$replace" == "*.католик" || "$replace" == "*.ком" || "$replace" == "*.мкд" || "$replace" == "*.мон" || "$replace" == "*.москва" || "$replace" == "*.онлайн" || "$replace" == "*.орг" || "$replace" == "*.рус" || "$replace" == "*.рф" || "$replace" == "*.сайт" || "$replace" == "*.срб" || "$replace" == "*.укр" || "$replace" == "*.қаз" || "$replace" == "*.հայ" || "$replace" == "*.טעסט" || "$replace" == "*.ישראל" || "$replace" == "*.קום" || "$replace" == "*.آزمایشی" || "$replace" == "*.إختبار" || "$replace" == "*.ابوظبي" || "$replace" == "*.اتصالات" || "$replace" == "*.ارامكو" || "$replace" == "*.الاردن" || "$replace" == "*.البحرين" || "$replace" == "*.الجزائر" || "$replace" == "*.السعودية" || "$replace" == "*.العليان" || "$replace" == "*.المغرب" || "$replace" == "*.امارات" || "$replace" == "*.ایران" || "$replace" == "*.بارت" || "$replace" == "*.بازار" || "$replace" == "*.بيتك" || "$replace" == "*.بھارت" || "$replace" == "*.تونس" || "$replace" == "*.سودان" || "$replace" == "*.سورية" || "$replace" == "*.شبكة" || "$replace" == "*.عراق" || "$replace" == "*.عرب" || "$replace" == "*.عمان" || "$replace" == "*.فلسطين" || "$replace" == "*.قطر" || "$replace" == "*.كاثوليك" || "$replace" == "*.كوم" || "$replace" == "*.مصر" || "$replace" == "*.مليسيا" || "$replace" == "*.موبايلي" || "$replace" == "*.موريتانيا" || "$replace" == "*.موقع" || "$replace" == "*.همراه" || "$replace" == "*.پاكستان" || "$replace" == "*.پاکستان" || "$replace" == "*.ڀارت" || "$replace" == "*.कॉम" || "$replace" == "*.नेट" || "$replace" == "*.परीक्षा" || "$replace" == "*.भारत" || "$replace" == "*.भारतम्" || "$replace" == "*.भारोत" || "$replace" == "*.संगठन" || "$replace" == "*.বাংলা" || "$replace" == "*.ভারত" || "$replace" == "*.ভাৰত" || "$replace" == "*.ਭਾਰਤ" || "$replace" == "*.ભારત" || "$replace" == "*.ଭାରତ" || "$replace" == "*.இந்தியா" || "$replace" == "*.இலங்கை" || "$replace" == "*.சிங்கப்பூர்" || "$replace" == "*.பரிட்சை" || "$replace" == "*.భారత్" || "$replace" == "*.ಭಾರತ" || "$replace" == "*.ഭാരതം" || "$replace" == "*.ලංකා" || "$replace" == "*.คอม" || "$replace" == "*.ไทย" || "$replace" == "*.ລາວ" || "$replace" == "*.გე" || "$replace" == "*.みんな" || "$replace" == "*.アマゾン" || "$replace" == "*.クラウド" || "$replace" == "*.グーグル" || "$replace" == "*.コム" || "$replace" == "*.ストア" || "$replace" == "*.セール" || "$replace" == "*.テスト" || "$replace" == "*.ファッション" || "$replace" == "*.ポイント" || "$replace" == "*.世界" || "$replace" == "*.中信" || "$replace" == "*.中国" || "$replace" == "*.中國" || "$replace" == "*.中文网" || "$replace" == "*.亚马逊" || "$replace" == "*.企业" || "$replace" == "*.佛山" || "$replace" == "*.信息" || "$replace" == "*.健康" || "$replace" == "*.八卦" || "$replace" == "*.公司" || "$replace" == "*.公益" || "$replace" == "*.台湾" || "$replace" == "*.台灣" || "$replace" == "*.商城" || "$replace" == "*.商店" || "$replace" == "*.商标" || "$replace" == "*.嘉里" || "$replace" == "*.嘉里大酒店" || "$replace" == "*.在线" || "$replace" == "*.大众汽车" || "$replace" == "*.大拿" || "$replace" == "*.天主教" || "$replace" == "*.娱乐" || "$replace" == "*.家電" || "$replace" == "*.工行" || "$replace" == "*.广东" || "$replace" == "*.微博" || "$replace" == "*.慈善" || "$replace" == "*.我爱你" || "$replace" == "*.手机" || "$replace" == "*.手表" || "$replace" == "*.招聘" || "$replace" == "*.政务" || "$replace" == "*.政府" || "$replace" == "*.新加坡" || "$replace" == "*.新闻" || "$replace" == "*.时尚" || "$replace" == "*.書籍" || "$replace" == "*.机构" || "$replace" == "*.测试" || "$replace" == "*.淡马锡" || "$replace" == "*.測試" || "$replace" == "*.游戏" || "$replace" == "*.澳門" || "$replace" == "*.点看" || "$replace" == "*.珠宝" || "$replace" == "*.移动" || "$replace" == "*.组织机构" || "$replace" == "*.网址" || "$replace" == "*.网店" || "$replace" == "*.网站" || "$replace" == "*.网络" || "$replace" == "*.联通" || "$replace" == "*.诺基亚" || "$replace" == "*.谷歌" || "$replace" == "*.购物" || "$replace" == "*.通販" || "$replace" == "*.集团" || "$replace" == "*.電訊盈科" || "$replace" == "*.飞利浦" || "$replace" == "*.食品" || "$replace" == "*.餐厅" || "$replace" == "*.香格里拉" || "$replace" == "*.香港" || "$replace" == "*.닷넷" || "$replace" == "*.닷컴" || "$replace" == "*.삼성" || "$replace" == "*.테스트" || "$replace" == "*.한국" ]];
				then
					pterodactyl=$(<$filename)
					echo "${pterodactyl//$search/$replace}" > $filename

					pterodactyll=$(<$filename)
					echo "${pterodactyll//$search2/$replace2}" > $filename

					validdomain="valid"
				fi
			done

			if [[ "$usedlocation" != "/var/www/" ]];
			then
				echo "" | sudo tee -a "$filename2"
				echo "<Directory $usedlocation>" | sudo tee -a "$filename2"
				echo "	Options Indexes FollowSymLinks" | sudo tee -a "$filename2"
				echo "	AllowOverride All" | sudo tee -a "$filename2"
				echo "	Require all granted" | sudo tee -a "$filename2"
				echo "</Directory>" | sudo tee -a "$filename2"
			fi

			tput reset
			tput clear
			$log
			sudo a2ensite pterodactyl.conf
			sudo a2dissite 000-default.conf
			sudo a2enmod rewrite
			sudo systemctl restart apache2
			$succeeded
			PWCdone="valid"
		else
			PWCdone="Invalid option"
		fi
done

# Docker Install

if [[ $MySQL_Configured == "N" || $MySQL_Configured == "n" ]];
then
	sudo chmod 777 /usr/share/mysql-common/
	sudo chmod 777 /usr/share/mysql-common/configure-symlinks
fi

$log
sudo curl -sSL https://get.docker.com/ | CHANNEL=stable bash
sudo apt-get -y install -f
sudo curl -sSL https://get.docker.com/ | CHANNEL=stable bash
sudo systemctl enable --now docker

# Wings Install
sudo mkdir -p /etc/pterodactyl
sudo curl -L -o /usr/local/bin/wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
sudo chmod u+x /usr/local/bin/wings

# User Input Request
tput reset
tput clear
UIRdone="invalid"
failure=""

while [[ "$UIRdone" != "valid" ]];
do
	$error
	echo "$failure"
	$info
	echo "It's now time to set-up your first node!"
	echo "Please go to the panel located at $replace and navigate to the Locations page"
	echo "After creating a new location please navigate to the Nodes page"
	echo
	echo "Create a new node and use $replace as the FQDN"
	echo "Tip: Leave automatic allocation on yes and the daemon ports default unless you know what you're doing"
	echo
	echo "Now go to the Configuration tab inside the node page you just created and select Generate Token"
	echo "!!ONLY!! copy the token (after --token) and put it inside of the prompt below"
	$ask
	read -p "Enter token here: " token
	$log

	if [[ "$token" == "" ]];
	then
		failure="You are required to provide the script with the token generated for your node, it cannot be empty."
		UIRdone="invalid"
	else
		$info
		echo "You've entered the following token: $token"
		$ask
		read -p "Is this correct? " -n 1 -r
		$log
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			$succeeded
			UIRdone="valid"
			failure=""
			sleep 2
			tput reset
			tput clear
			$log
		else
			$error
			UIRdone="invalid"
			failure="Please enter the correct token..."
			sleep 2
			tput reset
			tput clear
			$info
		fi
	fi
done

if [[ "$SSLMODE" == 1 ]];
then
	cd /etc/pterodactyl && sudo wings configure --panel-url https://"$replace" --token "$token" --node 1
fi

if [[ "$SSLMODE" == 2 ]];
then
	cd /etc/pterodactyl && sudo wings configure --panel-url http://"$replace" --token "$token" --node 1
fi

cd /home/"$name"/tmp-webpteroqinstaller || exit
sudo curl -LOs "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Web%20and%20Pterodactyl%20Unofficial%20Installer%20(Debian)/wings.service"
sudo cp wings.service /etc/systemd/system/wings.service
sudo systemctl enable --now wings
sudo systemctl start wings

# Configure Database Hosts
panelconfigured="no"
while [[ $panelconfigured != "yes" ]];
then
	tput reset
	tput clear
	$error
	echo $failure
	echo
	$info
	echo "The installation has reached it's final step!"
	echo "Right now everything should be working like it should."
	echo "However, the panel doesn't know which database to use to store server data and we cannot (yet) set this automatically."
	echo
	echo "Go to the panel again and navigate to the 'Databases' tab"
	echo "Create a new database host and put $replace in the 'Host' field."
	echo "The username should be pterodactyluser and the password is located under /home/$name/pterodactyl_db_guestpass.txt"
	echo "You may also link it to the previous created node if you want to."
	echo
	echo
	$ask
	read -p "Did you set-up the database host within the panel?: " setupcompleted
	$log

	if [[ $setupcompleted != "n" ]];
	then
		$succeeded
		echo "Thanks for using our installation script!"
		echo "Consider leaving a comment or help to improve the project by reporting bugs you may find or sending push requests."
		sleep 7
		$log
		panelconfigured="yes"
	else
		failure="It is required to complete setting up a database host for the pterodactyl panel."
		$log
		panelconfigured="no"
	fi
done

### Cleanup
cd "$STARTDIR" || exit
tput reset
tput clear
$succeeded
echo "The installation of the LAMP and pterodactyl server has finished"
echo "Temp files are located within /home/$name/tmp-webpteroqinstaller/"
$ask
read -p "Would you like to remove the temp files? " -n 1 -r
$log
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	$log
	sudo rm -rf "/home/$name/tmp-webpteroqinstaller"
	$succeeded
	echo "The temp files have been removed from this device!"
	echo "The script will close within 5 seconds..."
	sleep 5
	tput reset
	tput clear
	$log
else
	$succeeded
	echo "You've decided to keep the temp files on your device"
	echo "The script will close within 5 seconds..."
	sleep 5
	tput reset
	tput clear
	$info
fi

tput reset
tput clear
tput sgr0
sudo rm -rf /home/$name/WebPteroq_Debian_T-U20.04.sh
exit