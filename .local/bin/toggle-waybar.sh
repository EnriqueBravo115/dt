#!/bin/bash

# Revisa si Waybar está corriendo
if pgrep -x waybar > /dev/null; then
    pkill -x waybar
else
    # Espera un momento para evitar glitches visuales
    sleep 0.2
    waybar &
fi
