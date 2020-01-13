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

echo "About to start the uninstaller..."
sleep 2
echo "Here we go!!!"
sleep 1
tput reset
tput clear

#Information about the creator(s) and the script itself
tput setaf 2; echo "This script is originally created by Misha Opstal"
echo "This script will remove Java on your Linux device (Debian based)."
tput bold; echo "We are not the creators of Java and this is an unofficial script, we do NOT claim Java as our content and all copyrights, trademarks and other intellectual property belong to the Oracle Corporation!"
tput setaf 5; echo -n "Our Discord: "
echo -e '\e]8;;https://discordapp.com/invite/UfbNmJb\aOnTheLink official Discord server\e]8;;\a'
echo -n "The Java website: "
echo -e '\e]8;;https://www.oracle.com/java/\aJava\e]8;;\a'
tput setaf 69; echo "Thank you for using our uninstaller!"
tput bold && tput setaf 1; echo "===================================="
tput bold && tput setaf 5; echo ">>>>>>>>UNINSTALLER STARTED<<<<<<<<"
tput bold && tput setaf 1; echo "===================================="
tput sgr0 && tput setaf 4; echo "WARNING: We are not responsible for any damage to your device (that includes throwing it of a building, spilling coffee, water damage and ofcourse other things that might happen while uninstalling Java" && tput sgr0
tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "Do you want to continue? (Close terminal to cancel)..."

#sending positive reaction
tput setaf 6
echo ";)"

#There we go
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
        command_path=/opt/jdk/jdk1.8.0_231/bin/
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
lib_path=/opt/jdk/jdk-10.0.2/bin/jre/lib/amd64/
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --remove "mozilla-javaplugin.so" "$lib_path/libnpjp2.so"
    fi
lib_path=/opt/jdk/jdk-9.0.4/bin/jre/lib/amd64/
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --remove "mozilla-javaplugin.so" "$lib_path/libnpjp2.so"
    fi
lib_path=/opt/jdk/jdk1.8.0_231/bin/jre/lib/amd64/
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --remove "mozilla-javaplugin.so" "$lib_path/libnpjp2.so"
    fi
lib_path=/opt/jdk/jdk1.7.0_80/bin/jre/lib/amd64/
    if [[ -d "/usr/lib/mozilla/plugins/" ]] && [[ -f $lib_path ]]; then
        sudo update-alternatives --remove "mozilla-javaplugin.so" "$lib_path/libnpjp2.so"
    fi
sudo rm -rf /opt/jdk/*
sudo rm -rf /opt/jdk
sudo rm -rf /home/$USER/javainstaller*
sudo apt-get --yes --assume-yes update

#stop spinner
kill -9 $SPIN_PID

#Done
tput reset
tput clear
tput setaf 2
echo "Java has been uninstalled!"

tput setaf 3

#Waiting for user input
read -n 1 -s -r -p "press any key to exit..."

#Clear terminal before exiting the script
sudo rm -rf /home/$USER/javainstaller*
sudo rm -rf javauninstaller.sh
tput reset
tput sgr0
tput clear
exit
