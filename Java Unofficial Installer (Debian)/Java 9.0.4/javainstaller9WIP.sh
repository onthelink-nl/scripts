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

#Remove older files
        command_path=/opt/jdk/jdk-10.0.2/bin/
			sudo update-alternatives --remove "appletviewer" "$command_path/appletviewer"
			sudo update-alternatives --remove "idlj" "$command_path/idlj"
			sudo update-alternatives --remove "jar" "$command_path/jar"
			sudo update-alternatives --remove "jarsigner" "$command_path/jarsigner"
			sudo update-alternatives --remove "java" "$command_path/java"
			sudo update-alternatives --remove "javac" "$command_path/javac"
			sudo update-alternatives --remove "javadoc" "$command_path/javadoc"
			sudo update-alternatives --remove "javap" "$command_path/javap"
			sudo update-alternatives --remove "javaws" "$command_path/javaws"
			sudo update-alternatives --remove "jconsole" "$command_path/jconsole"
			sudo update-alternatives --remove "jcontrol" "$command_path/jcontrol"
			sudo update-alternatives --remove "jdb" "$command_path/jdb"
			sudo update-alternatives --remove "jinfo" "$command_path/jinfo"
			sudo update-alternatives --remove "jmap" "$command_path/jmap"
			sudo update-alternatives --remove "jmc" "$command_path/jmc"
			sudo update-alternatives --remove "jrunscript" "$command_path/jrunscript"
			sudo update-alternatives --remove "jstack" "$command_path/jstack"
			sudo update-alternatives --remove "jstat" "$command_path/jstat"
			sudo update-alternatives --remove "jstatd" "$command_path/jstatd"
			sudo update-alternatives --remove "keytool" "$command_path/keytool"
			sudo update-alternatives --remove "orbd" "$command_path/orbd"
			sudo update-alternatives --remove "pack200" "$command_path/pack200"
			sudo update-alternatives --remove "rmic" "$command_path/rmic"
			sudo update-alternatives --remove "rmid" "$command_path/rmid"
			sudo update-alternatives --remove "rmiregistry" "$command_path/rmiregistry"
			sudo update-alternatives --remove "schemagen" "$command_path/schemagen"
			sudo update-alternatives --remove "serialver" "$command_path/serialver"
			sudo update-alternatives --remove "servertool" "$command_path/servertool"
			sudo update-alternatives --remove "tnameserv" "$command_path/tnameserv"
			sudo update-alternatives --remove "unpack200" "$command_path/unpack200"
			sudo update-alternatives --remove "wsgen" "$command_path/wsgen"
			sudo update-alternatives --remove "wsimport" "$command_path/wsimport"
			sudo update-alternatives --remove "xjc" "$command_path/xjc"
			sudo update-alternatives --remove "javapackager" "$command_path/javapackager"
			sudo update-alternatives --remove "jcmd" "$command_path/jcmd"
			sudo update-alternatives --remove "jdeprscan" "$command_path/jdeprscan"
			sudo update-alternatives --remove "jdeps" "$command_path/jdeps"
			sudo update-alternatives --remove "jhsdb" "$command_path/jhsdb"
			sudo update-alternatives --remove "jimage" "$command_path/jimage"
			sudo update-alternatives --remove "jjs" "$command_path/jjs"
			sudo update-alternatives --remove "jlink" "$command_path/jlink"
			sudo update-alternatives --remove "jmod" "$command_path/jmod"
			sudo update-alternatives --remove "jps" "$command_path/jps"
			sudo update-alternatives --remove "jshell" "$command_path/jshell"
			sudo update-alternatives --remove "jweblauncher" "$command_path/jweblauncher"
			sudo update-alternatives --remove "jaotc" "$command_path/jaotc"
        command_path=/opt/jdk/jdk-9.0.4/bin/
			sudo update-alternatives --remove "appletviewer" "$command_path/appletviewer"
			sudo update-alternatives --remove "idlj" "$command_path/idlj"
			sudo update-alternatives --remove "jar" "$command_path/jar"
			sudo update-alternatives --remove "jarsigner" "$command_path/jarsigner"
			sudo update-alternatives --remove "java" "$command_path/java"
			sudo update-alternatives --remove "javac" "$command_path/javac"
			sudo update-alternatives --remove "javadoc" "$command_path/javadoc"
			sudo update-alternatives --remove "javah" "$command_path/javah"
			sudo update-alternatives --remove "javap" "$command_path/javap"
			sudo update-alternatives --remove "javaws" "$command_path/javaws"
			sudo update-alternatives --remove "jconsole" "$command_path/jconsole"
			sudo update-alternatives --remove "jcontrol" "$command_path/jcontrol"
			sudo update-alternatives --remove "jdb" "$command_path/jdb"
			sudo update-alternatives --remove "jinfo" "$command_path/jinfo"
			sudo update-alternatives --remove "jmap" "$command_path/jmap"
			sudo update-alternatives --remove "jmc" "$command_path/jmc"
			sudo update-alternatives --remove "jrunscript" "$command_path/jrunscript"
			sudo update-alternatives --remove "jstack" "$command_path/jstack"
			sudo update-alternatives --remove "jstat" "$command_path/jstat"
			sudo update-alternatives --remove "jstatd" "$command_path/jstatd"
			sudo update-alternatives --remove "keytool" "$command_path/keytool"
			sudo update-alternatives --remove "orbd" "$command_path/orbd"
			sudo update-alternatives --remove "pack200" "$command_path/pack200"
			sudo update-alternatives --remove "policytool" "$command_path/policytool"
			sudo update-alternatives --remove "rmic" "$command_path/rmic"
			sudo update-alternatives --remove "rmid" "$command_path/rmid"
			sudo update-alternatives --remove "rmiregistry" "$command_path/rmiregistry"
			sudo update-alternatives --remove "schemagen" "$command_path/schemagen"
			sudo update-alternatives --remove "serialver" "$command_path/serialver"
			sudo update-alternatives --remove "servertool" "$command_path/servertool"
			sudo update-alternatives --remove "tnameserv" "$command_path/tnameserv"
			sudo update-alternatives --remove "unpack200" "$command_path/unpack200"
			sudo update-alternatives --remove "wsgen" "$command_path/wsgen"
			sudo update-alternatives --remove "wsimport" "$command_path/wsimport"
			sudo update-alternatives --remove "xjc" "$command_path/xjc"
			sudo update-alternatives --remove "javapackager" "$command_path/javapackager"
			sudo update-alternatives --remove "jcmd" "$command_path/jcmd"
			sudo update-alternatives --remove "jdeprscan" "$command_path/jdeprscan"
			sudo update-alternatives --remove "jdeps" "$command_path/jdeps"
			sudo update-alternatives --remove "jhsdb" "$command_path/jhsdb"
			sudo update-alternatives --remove "jimage" "$command_path/jimage"
			sudo update-alternatives --remove "jjs" "$command_path/jjs"
			sudo update-alternatives --remove "jlink" "$command_path/jlink"
			sudo update-alternatives --remove "jmod" "$command_path/jmod"
			sudo update-alternatives --remove "jps" "$command_path/jps"
			sudo update-alternatives --remove "jshell" "$command_path/jshell"
			sudo update-alternatives --remove "jweblauncher" "$command_path/jweblauncher"
			sudo update-alternatives --remove "jaotc" "$command_path/jaotc"
        command_path=/opt/jdk/jdk1.8.0_241/bin/
			sudo update-alternatives --remove "appletviewer" "$command_path/appletviewer"
			sudo update-alternatives --remove "extcheck" "$command_path/extcheck"
			sudo update-alternatives --remove "idlj" "$command_path/idlj"
			sudo update-alternatives --remove "jar" "$command_path/jar"
			sudo update-alternatives --remove "jarsigner" "$command_path/jarsigner"
			sudo update-alternatives --remove "java" "$command_path/java"
			sudo update-alternatives --remove "javac" "$command_path/javac"
			sudo update-alternatives --remove "javadoc" "$command_path/javadoc"
			sudo update-alternatives --remove "javafxpackager" "$command_path/javafxpackager"
			sudo update-alternatives --remove "javah" "$command_path/javah"
			sudo update-alternatives --remove "javap" "$command_path/javap"
			sudo update-alternatives --remove "java-rmi.cgi" "$command_path/java-rmi.cgi"
			sudo update-alternatives --remove "javaws" "$command_path/javaws"
			sudo update-alternatives --remove "jconsole" "$command_path/jconsole"
			sudo update-alternatives --remove "jcontrol" "$command_path/jcontrol"
			sudo update-alternatives --remove "jdb" "$command_path/jdb"
			sudo update-alternatives --remove "jhat" "$command_path/jhat"
			sudo update-alternatives --remove "jinfo" "$command_path/jinfo"
			sudo update-alternatives --remove "jmap" "$command_path/jmap"
			sudo update-alternatives --remove "jmc" "$command_path/jmc"
			sudo update-alternatives --remove "jmc.ini" "$command_path/jmc.ini"
			sudo update-alternatives --remove "jrunscript" "$command_path/jrunscript"
			sudo update-alternatives --remove "jstack" "$command_path/jstack"
			sudo update-alternatives --remove "jstat" "$command_path/jstat"
			sudo update-alternatives --remove "jstatd" "$command_path/jstatd"
			sudo update-alternatives --remove "jvisualvm" "$command_path/jvisualvm"
			sudo update-alternatives --remove "keytool" "$command_path/keytool"
			sudo update-alternatives --remove "native2ascii" "$command_path/native2ascii"
			sudo update-alternatives --remove "orbd" "$command_path/orbd"
			sudo update-alternatives --remove "pack200" "$command_path/pack200"
			sudo update-alternatives --remove "policytool" "$command_path/policytool"
			sudo update-alternatives --remove "rmic" "$command_path/rmic"
			sudo update-alternatives --remove "rmid" "$command_path/rmid"
			sudo update-alternatives --remove "rmiregistry" "$command_path/rmiregistry"
			sudo update-alternatives --remove "schemagen" "$command_path/schemagen"
			sudo update-alternatives --remove "serialver" "$command_path/serialver"
			sudo update-alternatives --remove "servertool" "$command_path/servertool"
			sudo update-alternatives --remove "tnameserv" "$command_path/tnameserv"
			sudo update-alternatives --remove "unpack200" "$command_path/unpack200"
			sudo update-alternatives --remove "wsgen" "$command_path/wsgen"
			sudo update-alternatives --remove "wsimport" "$command_path/wsimport"
			sudo update-alternatives --remove "xjc" "$command_path/xjc"
			sudo update-alternatives --remove "javapackager" "$command_path/javapackager"
			sudo update-alternatives --remove "jcmd" "$command_path/jcmd"
			sudo update-alternatives --remove "jdeps" "$command_path/jdeps"
			sudo update-alternatives --remove "jjs" "$command_path/jjs"
			sudo update-alternatives --remove "jps" "$command_path/jps"
			sudo update-alternatives --remove "jsadebugd" "$command_path/jsadebugd"
			sudo update-alternatives --remove "ControlPanel" "$command_path/ControlPanel"
        command_path=/opt/jdk/jdk1.7.0_80/bin/
			sudo update-alternatives --remove "appletviewer" "$command_path/appletviewer"
			sudo update-alternatives --remove "apt" "$command_path/apt" 2> /dev/null | exec 1> /dev/tty
			sudo update-alternatives --remove "extcheck" "$command_path/extcheck"
			sudo update-alternatives --remove "idlj" "$command_path/idlj"
			sudo update-alternatives --remove "jar" "$command_path/jar"
			sudo update-alternatives --remove "jarsigner" "$command_path/jarsigner"
			sudo update-alternatives --remove "java" "$command_path/java"
			sudo update-alternatives --remove "javac" "$command_path/javac"
			sudo update-alternatives --remove "javadoc" "$command_path/javadoc"
			sudo update-alternatives --remove "javafxpackager" "$command_path/javafxpackager"
			sudo update-alternatives --remove "javah" "$command_path/javah"
			sudo update-alternatives --remove "javap" "$command_path/javap"
			sudo update-alternatives --remove "java-rmi.cgi" "$command_path/java-rmi.cgi"
			sudo update-alternatives --remove "javaws" "$command_path/javaws"
			sudo update-alternatives --remove "jconsole" "$command_path/jconsole"
			sudo update-alternatives --remove "jcontrol" "$command_path/jcontrol"
			sudo update-alternatives --remove "jdb" "$command_path/jdb"
			sudo update-alternatives --remove "jhat" "$command_path/jhat"
			sudo update-alternatives --remove "jinfo" "$command_path/jinfo"
			sudo update-alternatives --remove "jmap" "$command_path/jmap"
			sudo update-alternatives --remove "jmc" "$command_path/jmc"
			sudo update-alternatives --remove "jmc.ini" "$command_path/jmc.ini"
			sudo update-alternatives --remove "jrunscript" "$command_path/jrunscript"
			sudo update-alternatives --remove "jstack" "$command_path/jstack"
			sudo update-alternatives --remove "jstat" "$command_path/jstat"
			sudo update-alternatives --remove "jstatd" "$command_path/jstatd"
			sudo update-alternatives --remove "jvisualvm" "$command_path/jvisualvm"
			sudo update-alternatives --remove "keytool" "$command_path/keytool"
			sudo update-alternatives --remove "native2ascii" "$command_path/native2ascii"
			sudo update-alternatives --remove "orbd" "$command_path/orbd"
			sudo update-alternatives --remove "pack200" "$command_path/pack200"
			sudo update-alternatives --remove "policytool" "$command_path/policytool"
			sudo update-alternatives --remove "rmic" "$command_path/rmic"
			sudo update-alternatives --remove "rmid" "$command_path/rmid"
			sudo update-alternatives --remove "rmiregistry" "$command_path/rmiregistry"
			sudo update-alternatives --remove "schemagen" "$command_path/schemagen"
			sudo update-alternatives --remove "serialver" "$command_path/serialver"
			sudo update-alternatives --remove "servertool" "$command_path/servertool"
			sudo update-alternatives --remove "tnameserv" "$command_path/tnameserv"
			sudo update-alternatives --remove "unpack200" "$command_path/unpack200"
			sudo update-alternatives --remove "wsgen" "$command_path/wsgen"
			sudo update-alternatives --remove "wsimport" "$command_path/wsimport"
			sudo update-alternatives --remove "xjc" "$command_path/xjc"
			sudo update-alternatives --remove "jsadebugd" "$command_path/jsadebugd"
			sudo update-alternatives --remove "ControlPanel" "$command_path/ControlPanel"
			sudo update-alternatives --remove "jcmd" "$command_path/jcmd"
			sudo update-alternatives --remove "jps" "$command_path/jps"
lib_path=/opt/jdk/jdk-10.0.2/bin/jre/lib/amd64/libnpjp2.so
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --remove "mozilla-javaplugin.so" "$lib_path"
    fi
lib_path=/opt/jdk/jdk-9.0.4/bin/jre/lib/amd64/libnpjp2.so
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --remove "mozilla-javaplugin.so" "$lib_path"
    fi
lib_path=/opt/jdk/jdk1.8.0_241/bin/jre/lib/amd64/libnpjp2.so
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --remove "mozilla-javaplugin.so" "$lib_path"
    fi
lib_path=/opt/jdk/jdk1.7.0_80/bin/jre/lib/amd64/libnpjp2.so
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --remove "mozilla-javaplugin.so" "$lib_path"
    fi
sudo rm -rf /opt/jdk/*
sudo rm -rf /opt/jdk
sudo rm -rf /home/$USER/javainstaller*
sudo apt-get --yes --assume-yes update

#stop spinner
kill -9 $SPIN_PID

#Clear terminal before execution of the script
tput reset
tput clear

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64-bit stuff here
#Creating temp folder for installation files
sudo rm -rf /home/$USER/javainstaller*
mkdir /home/$USER/javainstaller9_0_4
cd /home/$USER/javainstaller9_0_4

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will install the Java JDK version 9.0.4 on your Linux device (Debian based)."
tput bold; echo "We are not the creators of Java and this is an unofficial script, we do NOT claim Java as our content and all copyrights, trademarks and other intellectual property belong to the Oracle Corporation!"
tput setaf 5; echo -n "Our Discord Server: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOTL Discord server\e]8;;\a'
echo -n "The Java website: "
echo -e '\e]8;;https://www.oracle.com/java/\aJava\e]8;;\a'
tput setaf 69; echo "Thank you for using our script!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>INSTALLATION STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while installing Java" && tput sgr0
tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

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

#Installing/updating
tput setaf 1
echo "Installing dependencies"
tput setaf 6
sudo apt-get --yes --assume-yes install wget curl tar 2> /dev/null | exec 1> /dev/tty
tput setaf 2
echo "Dependencies have been installed"
tput setaf 1
echo "Downloading version 9.0.4..."
tput setaf 6
sudo curl -LO "https://github.com/onthelink-nl/scripts/raw/master/Java%20Unofficial%20Installer%20(Debian)/Java%209.0.4/jdk-9.0.4_linux-x64_bin.tar.gz"
tput setaf 2
echo "Files have been downloaded"
sleep 1
tput setaf 1
echo "Creating installation directories..."
tput setaf 6
sudo mkdir /opt/jdk
tput setaf 2
echo "Installation directories created"
tput setaf 1
echo "Extracting installation files..."
tput setaf 6
sudo tar -zxf jdk-9.0.4_linux-x64_bin.tar.gz -C /opt/jdk
tput setaf 2
echo "Installation files extracted"
tput setaf 1
echo "Copying files..."

# Run sudo update-alternatives commands
    echo "Running sudo update-alternatives..."
        command_path=/opt/jdk/jdk-9.0.4/bin/
			sudo update-alternatives --install "/usr/bin/appletviewer" "appletviewer" "$command_path/appletviewer" 101
			sudo update-alternatives --install "/usr/bin/idlj" "idlj" "$command_path/idlj" 101
			sudo update-alternatives --install "/usr/bin/jar" "jar" "$command_path/jar" 101
			sudo update-alternatives --install "/usr/bin/jarsigner" "jarsigner" "$command_path/jarsigner" 101
			sudo update-alternatives --install "/usr/bin/java" "java" "$command_path/java" 101
			sudo update-alternatives --install "/usr/bin/javac" "javac" "$command_path/javac" 101
			sudo update-alternatives --install "/usr/bin/javadoc" "javadoc" "$command_path/javadoc" 101
			sudo update-alternatives --install "/usr/bin/javah" "javah" "$command_path/javah" 101
			sudo update-alternatives --install "/usr/bin/javap" "javap" "$command_path/javap" 101
			sudo update-alternatives --install "/usr/bin/javaws" "javaws" "$command_path/javaws" 101
			sudo update-alternatives --install "/usr/bin/jconsole" "jconsole" "$command_path/jconsole" 101
			sudo update-alternatives --install "/usr/bin/jcontrol" "jcontrol" "$command_path/jcontrol" 101
			sudo update-alternatives --install "/usr/bin/jdb" "jdb" "$command_path/jdb" 101
			sudo update-alternatives --install "/usr/bin/jinfo" "jinfo" "$command_path/jinfo" 101
			sudo update-alternatives --install "/usr/bin/jmap" "jmap" "$command_path/jmap" 101
			sudo update-alternatives --install "/usr/bin/jmc" "jmc" "$command_path/jmc" 101
			sudo update-alternatives --install "/usr/bin/jrunscript" "jrunscript" "$command_path/jrunscript" 101
			sudo update-alternatives --install "/usr/bin/jstack" "jstack" "$command_path/jstack" 101
			sudo update-alternatives --install "/usr/bin/jstat" "jstat" "$command_path/jstat" 101
			sudo update-alternatives --install "/usr/bin/jstatd" "jstatd" "$command_path/jstatd" 101
			sudo update-alternatives --install "/usr/bin/keytool" "keytool" "$command_path/keytool" 101
			sudo update-alternatives --install "/usr/bin/orbd" "orbd" "$command_path/orbd" 101
			sudo update-alternatives --install "/usr/bin/pack200" "pack200" "$command_path/pack200" 101
			sudo update-alternatives --install "/usr/bin/policytool" "policytool" "$command_path/policytool" 101
			sudo update-alternatives --install "/usr/bin/rmic" "rmic" "$command_path/rmic" 101
			sudo update-alternatives --install "/usr/bin/rmid" "rmid" "$command_path/rmid" 101
			sudo update-alternatives --install "/usr/bin/rmiregistry" "rmiregistry" "$command_path/rmiregistry" 101
			sudo update-alternatives --install "/usr/bin/schemagen" "schemagen" "$command_path/schemagen" 101
			sudo update-alternatives --install "/usr/bin/serialver" "serialver" "$command_path/serialver" 101
			sudo update-alternatives --install "/usr/bin/servertool" "servertool" "$command_path/servertool" 101
			sudo update-alternatives --install "/usr/bin/tnameserv" "tnameserv" "$command_path/tnameserv" 101
			sudo update-alternatives --install "/usr/bin/unpack200" "unpack200" "$command_path/unpack200" 101
			sudo update-alternatives --install "/usr/bin/wsgen" "wsgen" "$command_path/wsgen" 101
			sudo update-alternatives --install "/usr/bin/wsimport" "wsimport" "$command_path/wsimport" 101
			sudo update-alternatives --install "/usr/bin/xjc" "xjc" "$command_path/xjc" 101
			sudo update-alternatives --install "/usr/bin/javapackager" "javapackager" "$command_path/javapackager" 101
			sudo update-alternatives --install "/usr/bin/jcmd" "jcmd" "$command_path/jcmd" 101
			sudo update-alternatives --install "/usr/bin/jdeprscan" "jdeprscan" "$command_path/jdeprscan" 101
			sudo update-alternatives --install "/usr/bin/jdeps" "jdeps" "$command_path/jdeps" 101
			sudo update-alternatives --install "/usr/bin/jhsdb" "jhsdb" "$command_path/jhsdb" 101
			sudo update-alternatives --install "/usr/bin/jimage" "jimage" "$command_path/jimage" 101
			sudo update-alternatives --install "/usr/bin/jjs" "jjs" "$command_path/jjs" 101
			sudo update-alternatives --install "/usr/bin/jlink" "jlink" "$command_path/jlink" 101
			sudo update-alternatives --install "/usr/bin/jmod" "jmod" "$command_path/jmod" 101
			sudo update-alternatives --install "/usr/bin/jps" "jps" "$command_path/jps" 101
			sudo update-alternatives --install "/usr/bin/jshell" "jshell" "$command_path/jshell" 101
			sudo update-alternatives --install "/usr/bin/jweblauncher" "jweblauncher" "$command_path/jweblauncher" 101
			sudo update-alternatives --install "/usr/bin/jaotc" "jaotc" "$command_path/jaotc" 101
		command_path=/opt/jdk/jdk-9.0.4/bin/
			sudo update-alternatives --set "appletviewer" "$command_path/appletviewer"
			sudo update-alternatives --set "idlj" "$command_path/idlj"
			sudo update-alternatives --set "jar" "$command_path/jar"
			sudo update-alternatives --set "jarsigner" "$command_path/jarsigner"
			sudo update-alternatives --set "java" "$command_path/java"
			sudo update-alternatives --set "javac" "$command_path/javac"
			sudo update-alternatives --set "javadoc" "$command_path/javadoc"
			sudo update-alternatives --set "javah" "$command_path/javah"
			sudo update-alternatives --set "javap" "$command_path/javap"
			sudo update-alternatives --set "javaws" "$command_path/javaws"
			sudo update-alternatives --set "jconsole" "$command_path/jconsole"
			sudo update-alternatives --set "jcontrol" "$command_path/jcontrol"
			sudo update-alternatives --set "jdb" "$command_path/jdb"
			sudo update-alternatives --set "jinfo" "$command_path/jinfo"
			sudo update-alternatives --set "jmap" "$command_path/jmap"
			sudo update-alternatives --set "jmc" "$command_path/jmc"
			sudo update-alternatives --set "jrunscript" "$command_path/jrunscript"
			sudo update-alternatives --set "jstack" "$command_path/jstack"
			sudo update-alternatives --set "jstat" "$command_path/jstat"
			sudo update-alternatives --set "jstatd" "$command_path/jstatd"
			sudo update-alternatives --set "keytool" "$command_path/keytool"
			sudo update-alternatives --set "orbd" "$command_path/orbd"
			sudo update-alternatives --set "pack200" "$command_path/pack200"
			sudo update-alternatives --set "policytool" "$command_path/policytool"
			sudo update-alternatives --set "rmic" "$command_path/rmic"
			sudo update-alternatives --set "rmid" "$command_path/rmid"
			sudo update-alternatives --set "rmiregistry" "$command_path/rmiregistry"
			sudo update-alternatives --set "schemagen" "$command_path/schemagen"
			sudo update-alternatives --set "serialver" "$command_path/serialver"
			sudo update-alternatives --set "servertool" "$command_path/servertool"
			sudo update-alternatives --set "tnameserv" "$command_path/tnameserv"
			sudo update-alternatives --set "unpack200" "$command_path/unpack200"
			sudo update-alternatives --set "wsgen" "$command_path/wsgen"
			sudo update-alternatives --set "wsimport" "$command_path/wsimport"
			sudo update-alternatives --set "xjc" "$command_path/xjc"
			sudo update-alternatives --set "javapackager" "$command_path/javapackager"
			sudo update-alternatives --set "jcmd" "$command_path/jcmd"
			sudo update-alternatives --set "jdeprscan" "$command_path/jdeprscan"
			sudo update-alternatives --set "jdeps" "$command_path/jdeps"
			sudo update-alternatives --set "jhsdb" "$command_path/jhsdb"
			sudo update-alternatives --set "jimage" "$command_path/jimage"
			sudo update-alternatives --set "jjs" "$command_path/jjs"
			sudo update-alternatives --set "jlink" "$command_path/jlink"
			sudo update-alternatives --set "jmod" "$command_path/jmod"
			sudo update-alternatives --set "jps" "$command_path/jps"
			sudo update-alternatives --set "jshell" "$command_path/jshell"
			sudo update-alternatives --set "jweblauncher" "$command_path/jweblauncher"
			sudo update-alternatives --set "jaotc" "$command_path/jaotc"

    lib_path=/opt/jdk/jdk-9.0.4/bin/jre/lib/amd64/
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --install "/usr/lib/mozilla/plugins/libjavaplugin.so" "mozilla-javaplugin.so" "$lib_path/libnpjp2.so" 101
        sudo update-alternatives --set "mozilla-javaplugin.so" "$lib_path/libnpjp2.so"
    fi

# Create system preferences directory
sudo rm -rf /etc/.java*
java_system_prefs_dir="/etc/.java/.systemPrefs"
if [[ ! -d $java_system_prefs_dir ]]; then
        echo "Creating $java_system_prefs_dir"
        sudo mkdir -p $java_system_prefs_dir 2> /dev/null | exec 1> /dev/tty
        sudo chown -R $SUDO_USER:$SUDO_USER $java_system_prefs_dir 2> /dev/null | exec 1> /dev/tty
    fi

    if grep -q "export JAVA_HOME=.*" home/$USER/.bashrc; then
        sudo sed -i "s|export JAVA_HOME=.*|export JAVA_HOME=/opt/jdk/jdk-9.0.4/|" home/$USER/.bashrc
    else
        echo "export JAVA_HOME=/opt/jdk/jdk-9.0.4/" >> home/$USER/.bashrc
    fi
    source home/$USER/.bashrc

sleep 2
tput sgr0
tput reset
tput setaf 2
tput bold
echo "Java JDK Version 9.0.4 is now installed on your system!"
tput sgr0

#stop spinner
kill -9 $SPIN_PID

#Removing local script files
cd -
sudo rm -rf "javainstaller9.sh"
sudo rm -rf /home/$USER/javainstaller*

#Waiting for user input
read -n 1 -s -r -p "Press any key to continue..."

#sending positive reaction
tput setaf 6
echo ";)"

#quit
tput reset
tput sgr0
tput clear
exit

else
  # 32-bit stuff here
tput setaf 6
echo "This version is not available for 32-bit systems, please use one of the 32-bit compatible versions from the JAVA-MENU"
sleep 1
tput setaf 3
echo "returning to JAVA-MENU in 3 seconds"
tput setaf 2
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
tput sgr0
tput reset
tput clear
sudo curl -LO "https://raw.githubusercontent.com/onthelink-nl/scripts/master/Java%20Unofficial%20Installer%20(Debian)/OnTheLink_JAVA-MENUWIP.sh" && bash OnTheLink_JAVA-MENUWIP.sh
exit
fi
