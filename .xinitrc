#!/bin/bash

mpd &
picom &
blueman-applet &
/usr/local/bin/dwmblocks &
setxkbmap us -variant altgr-intl
dwm
