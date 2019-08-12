#!/bin/bash

#Create directory if it doesn't exist already
mkdir -p "/home/$USER/qgisfiles/"

#Copy the files
for i in $(find /run/user/1000/doc/by-app/org.qgis.qgis -type f); do
    cp $i ~/qgisfiles/
done