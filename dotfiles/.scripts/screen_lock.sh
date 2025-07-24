#!/bin/bash

scrot -z /tmp/screen_locked.png

mogrify -blur 0x8 /tmp/screen_locked.png

i3lock -i /tmp/screen_locked.png

rm /tmp/screen_locked.png
