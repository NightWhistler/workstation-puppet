#!/bin/bash
MOUSE_ID=`xinput list|grep -i "optical mouse"|grep id=|cut -f 2| cut -f 2 -d =`

NAT_SCROLL=`xinput list-props $MOUSE_ID | grep -i "natural scrolling enabled" | grep -i -v "default" | grep -o -E "\\(([1-9]+)\\)" | grep -o -E "[0-9]+"`

echo "Setting property $NAT_SCROLL for Mouse $MOUSE_ID to 1"

#Enable natural scrolling on external mouse
# xinput set-prop $MOUSE_ID 276 1
xinput set-prop $MOUSE_ID $NAT_SCROLL 1

#Set left-handed buttons
xinput set-button-map $MOUSE_ID 3 2 1

