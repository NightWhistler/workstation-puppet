#!/bin/bash
MOUSE_ID=`xinput list|grep -i mouse|grep id=|cut -f 2| cut -f 2 -d =`

#Enable natural scrolling on external mouse
#xinput set-prop $MOUSE_ID 276 1
xinput set-prop $MOUSE_ID 312 1

#Set left-handed buttons
xinput set-button-map $MOUSE_ID 3 2 1


