#!/bin/bash
xrandr --output eDP --primary --mode 1920x1200 --rate 144.0 --output DisplayPort-0 --mode 1920x1080 --above eDP
i3-msg restart