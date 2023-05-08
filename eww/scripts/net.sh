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

kind() {
    if [ "$(cat /sys/class/net/enp7s0/operstate)" = "up" ]; then
        echo "ether"
    elif [ "$(cat /sys/class/net/wlan0/operstate)" = "up" ]; then
        echo "wifi"
    else
        echo "none"
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
    kind)
        echo "$(kind)"
        ;;
    *)
        echo "Usage: $0 {icon|status|kind}"
        exit 2
esac
