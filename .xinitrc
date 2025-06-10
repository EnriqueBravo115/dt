#!/bin/bash

mpd &
picom &
setxkbmap us -variant altgr-intl &
blueman-applet &
/usr/local/bin/dwmblocks &
dwm
