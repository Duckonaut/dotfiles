#!/bin/sh

title() {
    if [ "$(multiplayerctl status)" = "Playing" ]; then
        echo "$(multiplayerctl metadata --format "{{title}} - {{artist}}")"
    elif [ "$(multiplayerctl status)" = "Paused" ]; then
        echo "$(multiplayerctl metadata --format "{{title}} - {{artist}}")"
    else
        echo "Nothing playing"
    fi
}

icon() {
    if [ "$(multiplayerctl status)" = "Playing" ]; then
        echo ""
    elif [ "$(multiplayerctl status)" = "Paused" ]; then
        echo ""
    else
        echo "󰝛"
    fi
}

case "$1" in
    icon)
        echo "$(icon)"
        ;;
    title)
        echo "$(title)"
        ;;
    *)
        echo "Usage: $0 {icon|title}"
        exit 2
esac
