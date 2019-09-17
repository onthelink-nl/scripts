#!/bin/bash

for i in $(find /run/user/1000/doc/by-app/org.qgis.qgis -type f); do
    cp $i ~/
done