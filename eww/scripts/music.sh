#!/usr/bin/env bash

title() {
    if [ "$(multiplayerctl status)" = "Playing" ]; then
        echo "$(multiplayerctl metadata --format "{{title}} - {{artist}}")"
    elif [ "$(multiplayerctl status)" = "Paused" ]; then
        echo "$(multiplayerctl metadata --format "{{title}} - {{artist}}")"
    else
        echo "Nothing playing"
    fi
}

titlefollow() {
    multiplayerctl metadata --format '{{artist}} - {{title}}' --follow | sed --unbuffered 's/^$/Nothing playing/g'
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
    titlefollow)
        titlefollow
        ;;
    *)
        echo "Usage: $0 {icon|title|titlefollow}"
        exit 2
esac
