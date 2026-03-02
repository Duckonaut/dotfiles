#!/bin/sh

UPDATE_COUNT=$(checkupdates 2>/dev/null | wc -l)

# Icon based on network status
icon() {
    if [ "$UPDATE_COUNT" -gt 0 ]; then
        echo ""
    else
        echo ""
    fi
}

status() {
    if [ "$UPDATE_COUNT" -gt 0 ]; then
        echo "updates-available"
    else
        echo "updates-up-to-date"
    fi
}

info() {
    if [ "$UPDATE_COUNT" -gt 0 ]; then
        echo "$UPDATE_COUNT updates available"
    else
        echo "Up to date"
    fi
}

apply() {
    eww update updates-icon=$(icon) &
    eww update updates-info="$(info)" &
}

case "$1" in
    icon)
        echo "$(icon)"
        ;;
    status)
        echo "$(status)"
        ;;
    info)
        echo "$(info)"
        ;;
    apply)
        apply
        ;;
    *)
        echo "Usage: $0 {icon|status|info|apply}"
        exit 2
esac
