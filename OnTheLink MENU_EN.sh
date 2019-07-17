tput reset
selection=
until [ "$selection" = "0" ]; do
echo "
OnTheLink MENU
1 - install/reïnstall QGIS
0 - Exit Script
"
    echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
        echo "Preparing to install QGIS"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/Startup/QgisStartEN.sh
        sleep 2 ; sudo bash QgisStartEN.sh
        ;;
    0 ) 
        exit
        ;;
    * ) 
        echo "Please enter 1 or 0"
esac
done
