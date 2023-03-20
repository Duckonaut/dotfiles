#!/bin/sh

# Icon based on network status
icon() {
    if [ "$(cat /sys/class/net/enp7s0/operstate)" = "up" ]; then
        echo ""
    elif [ "$(cat /sys/class/net/wlan0/operstate)" = "up" ]; then
        echo ""
    else
        echo "睊"
    fi
}

status() {
    if [ "$(cat /sys/class/net/enp7s0/operstate)" = "up" ]; then
        ip addr show enp7s0 | grep -Po 'inet \K[\d.]+'
    elif [ "$(cat /sys/class/net/wlan0/operstate)" = "up" ]; then
        # SSID and signal strength percentage
        echo "$(iwgetid -r)"
    else
        echo "disconnected"
    fi
}

case "$1" in
    icon)
        echo "$(icon)"
        ;;
    status)
        echo "$(status)"
        ;;
    *)
        echo "Usage: $0 {icon|status}"
        exit 2
esac
