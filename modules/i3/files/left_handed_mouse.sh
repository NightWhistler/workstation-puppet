#!/bin/bash
MOUSE_ID=`xinput list|grep -i mouse|grep id=|cut -f 2| cut -f 2 -d =`
xinput set-button-map $MOUSE_ID 3 2 1
