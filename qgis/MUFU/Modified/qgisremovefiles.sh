#!/bin/bash

rsync -a --remove-source-files /run/user/1000/doc/by-app/org.qgis.qgis /tmp
cd /run/user/1000/doc/by-app/
sudo find -depth -type d -empty -delete
cd /home/$USER
rsync -a --remove-source-files /home/$USER/org.qgis.qgis /tmp
sudo find -depth -type d -empty -delete
rsync -a --exclude=".*" --remove-source-files /home/$USER/* /tmp
sudo find -depth -type d -empty -delete
mkdir "/home/$USER/qgisfiles/"