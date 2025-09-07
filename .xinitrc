#!/bin/bash

mpd &
picom &
setxkbmap us -variant altgr-intl &
xrandr --output eDP-1 --off &
exec i3
