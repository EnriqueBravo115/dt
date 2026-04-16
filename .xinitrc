#!/bin/bash

picom &
setxkbmap us -variant altgr-intl &
blueman-applet &
exec i3
