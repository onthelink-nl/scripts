#!/bin/bash

mkdir -p "/home/$USER/qgisfiles/"
for i in $(find /run/user/1000/doc/by-app/org.qgis.qgis -type f); do
    cp $i /home/$USER/qgisfiles/
done