#!/bin/bash

mpd &
picom &
setxkbmap us -variant altgr-intl &
feh --bg-fill /mnt/disk/wallpapers/secure/metro.jpg
blueman-applet &
/usr/local/bin/dwmblocks &
dwm
