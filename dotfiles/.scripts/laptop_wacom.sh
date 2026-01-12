#!/bin/bash

xrandr --output eDP --primary --mode 1920x1200 --rate 144.0 --output HDMI-A-0 --mode 1920x1080 --left-of eDP
xsetwacom set "Wacom Cintiq 16 Pen stylus" MapToOutput HDMI-A-0
xsetwacom set "Waxom Cintiq 16 Pen eraser" MapToOutput HDMI-A-0
# xsetwacom set "Wacom Cintiq 16 stylus" Button 1 "key ctrl z"

i3-msg restart


