#!/bin/bash

xrandr --output DP-3 --primary --mode 1920x1080 --rate 144.0 --output HDMI-1 --mode 1920x1080 --right-of DP-3
xsetwacom set 11 MapToOutput HDMI-1
xsetwacom set 15 MapToOutput HDMI-1
# xsetwacom set "Wacom Cintiq 16 stylus" Button 1 "key ctrl z"

i3-msg restart


