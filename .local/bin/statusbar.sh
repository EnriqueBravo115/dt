#!/bin/bash

while true; do
    # Ethernet
    eth=$(cat /sys/class/net/eno1/operstate 2>/dev/null)
    if [ "$eth" = "up" ]; then
        net="ETH"
    else
        net="ETH: down"
    fi

    # Memory
    mem=$(free -h | awk '/^Mem:/ {print $3" / "$2}')

    # Disk
    disk=$(df -h / | awk 'NR==2 {print $3" / "$2}')

    # CPU temp
    temp=$(awk '{printf "%.0f", $1/1000}' /sys/class/hwmon/hwmon2/temp1_input 2>/dev/null)

    # CPU usage
    cpu=$(top -bn1 | awk '/^%Cpu/ {printf "%.0f%%", $2+$4}')

    # Volume
    #vol=$(amixer get Master | awk -F'[][]' '/Left:/ {print $2}')

    # Date
    datetime=$(date +" %d-%m-%y - %H:%M")

    xsetroot -name "$net | $mem | $disk | ${temp}° | $cpu | $datetime"

    sleep 5
done &
