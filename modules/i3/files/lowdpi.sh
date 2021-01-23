#!/bin/bash

echo 96 > ~/.dpi
xrandr --dpi 96 
#xrandr --output eDP1 --scale 0.66x0.66
sudo dconf write /org/gnome/desktop/interface/text-scaling-factor 1.0

echo "Xft.dpi: $DPI" > ~/.Xresources
