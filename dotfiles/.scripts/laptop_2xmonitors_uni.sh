#!/bin/bash
xrandr --output eDP --primary --mode 1920x1200 --rate 144.0 --output DisplayPort-0 --mode 1920x1080 --above eDP
i3-msg restart
# I dont quite know why, but the above restart command fails to actually restart the applets, so manually restarted here
i3-msg exec nm-applet
i3-msg exec blueman-applet