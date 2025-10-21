#!/usr/bin/env bash

title() {
    if [ "$(/home/duckonaut/.cargo/bin/multiplayerctl status)" = "Playing" ]; then
        echo "$(/home/duckonaut/.cargo/bin/multiplayerctl metadata --format "{{title}} - {{artist}}")"
    elif [ "$(/home/duckonaut/.cargo/bin/multiplayerctl status)" = "Paused" ]; then
        echo "$(/home/duckonaut/.cargo/bin/multiplayerctl metadata --format "{{title}} - {{artist}}")"
    else
        echo "Nothing playing"
    fi
}

titlefollow() {
    /home/duckonaut/.cargo/bin/multiplayerctl metadata --format '{{title}} - {{artist}}' --follow | sed --unbuffered 's/^$/Nothing playing/g'
}

icon() {
    if [ "$(/home/duckonaut/.cargo/bin/multiplayerctl status)" = "Playing" ]; then
        echo ""
    elif [ "$(/home/duckonaut/.cargo/bin/multiplayerctl status)" = "Paused" ]; then
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
