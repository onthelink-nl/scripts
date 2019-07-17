selection=
until [ "$selection" = "0" ]; do
echo "
OnTheLink MENU
1 - installeer/herinstalleer QGIS
0 - Sluit dit menu
"
    echo -n "Voer uw keuze in: "
    read -r selection
    echo ""
case $selection in
    1 ) 
        echo "Voorbereiden om QGIS te installeren"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/Startup/QgisStartNL.sh
        sleep 2 ; sudo bash QgisStartNL.sh
        ;;
    0 ) 
        exit
        ;;
    * ) 
        echo "Voer alstublieft alleen de keuzes 1 of 0 in..."
        sleep 1 ; tput reset
esac
done
