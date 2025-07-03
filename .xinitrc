#!/bin/bash

mpd &
picom &
setxkbmap us -variant altgr-intl &
blueman-applet &
xfce4-power-manager &
volumeicon &
nm-applet &
exec i3
