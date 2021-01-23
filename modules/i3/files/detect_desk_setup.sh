#!/bin/bash

if xrandr --query | grep "^HDMI1 connected";
then
  #Set external screen as primary
  xrandr --output HDMI1 --right-of eDP1 --primary --auto
  ~/bin/left_handed_mouse.sh
else
  #Set laptop screen as primary
  xrandr --output eDP1 --primary
  xrandr --output HDMI1 --off
fi

#Always set the key bindings
xmodmap ~/.xmodmaprc

#Reset the background
feh --bg-fill --random ~/Documents/Afbeeldingen/Wallpapers
