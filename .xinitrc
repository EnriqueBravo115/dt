#!/bin/bash

mpd &
picom &
setxkbmap us -variant altgr-intl &
blueman-applet &
xrandr --output eDP-1 --off &
exec i3
