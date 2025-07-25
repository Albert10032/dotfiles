#!/bin/bash

# This is to interupt any video currently playing.
# MAY BREAK OTHER STUFF BY SENDING SPACE INPUTS TO WHATEVER THE ACTIVE WINDOW IS WHEN THIS SCRIPT IS RUN.
# BE CAREFUL WITH THIS ONE!!!
# xvkbd -xsendevent -text " "

scrot /tmp/screen_locked.png

mogrify -blur 0x8 /tmp/screen_locked.png

i3lock -i /tmp/screen_locked.png --show-failed-attempts

rm /tmp/screen_locked.png

