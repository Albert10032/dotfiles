#!/bin/bash

if [ $HOSTNAME = "alberts-laptop" ]; then
    echo /home/$USER/.config/i3status/config-laptop
else
    echo /home/$USER/.config/i3status/config
fi