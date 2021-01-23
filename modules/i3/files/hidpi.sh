#!/bin/bash

DPI=144
echo $DPI > ~/.dpi

xrandr --dpi $DPI
xrandr --output eDP1 --scale 1x1
sudo dconf write /org/gnome/desktop/interface/text-scaling-factor 1.5

echo "Xft.dpi: $DPI" > ~/.Xresources
