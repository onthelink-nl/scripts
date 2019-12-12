#!/bin/bash

for i in $(find /run/user/1000/doc/by-app/org.qgis.qgis -type f); do
    cp $i ~/
done

cd /home/$USER
rsync -a --exclude=".*" --remove-source-files /home/$USER/.xdp* /tmp
sudo find -depth -type d -empty -delete
