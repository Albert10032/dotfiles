#!/bin/bash
xrandr --output eDP --primary --mode 1920x1200 --rate 144.0 --output DisplayPort-0 --off
i3-msg restart
i3-msg exec nm-applet
i3-msg exec blueman-applet
i3-msg exec ibus-daemon