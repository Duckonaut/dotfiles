#!/bin/sh

icon() {
    if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]; then
        echo ""
    elif [ "$(cat /sys/class/power_supply/BAT0/status)" = "Not charging" ]; then
        echo ""
    elif [ $(cat /sys/class/power_supply/BAT0/capacity) -gt 90 ]; then
        echo ""
    elif [ $(cat /sys/class/power_supply/BAT0/capacity) -gt 80 ]; then
        echo ""
    elif [ $(cat /sys/class/power_supply/BAT0/capacity) -gt 60 ]; then
        echo ""
    elif [ $(cat /sys/class/power_supply/BAT0/capacity) -gt 40 ]; then
        echo ""
    elif [ $(cat /sys/class/power_supply/BAT0/capacity) -gt 20 ]; then
        echo ""
    else
        echo ""
    fi
}

info() {
    if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]; then
        echo "charging"
    elif [ "$(cat /sys/class/power_supply/BAT0/status)" = "Not charging" ]; then
        echo "plugged"
    elif [ "$(cat /sys/class/power_supply/BAT0/status)" = "Discharging" ]; then
        echo "discharging"
    elif [ $(cat /sys/class/power_supply/BAT0/capacity) -gt 90 ]; then
        echo "full"
    elif [ $(cat /sys/class/power_supply/BAT0/capacity) -gt 25 ]; then
        echo "discharging"
    else
        echo "critical"
    fi
}

case "$1" in
    icon)
        echo "$(icon)"
        ;;
    status)
        echo "$(info)"
        ;;
    *)
        echo "Usage: $0 {icon|status}"
        exit 2
esac
