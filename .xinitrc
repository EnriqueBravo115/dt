#!/bin/bash

mpd &
picom &
setxkbmap us -variant altgr-intl &
blueman-applet &
xfce4-power-manager &
volumeicon &
xrandr --output eDP-1 --off &
exec i3
