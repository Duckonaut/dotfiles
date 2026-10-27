#!/bin/env sh

# Toggle zen mode on and off

# make sure /tmp/zen_enabled exists
if [ ! -f /tmp/zen_enabled ]; then
    echo "0" > /tmp/zen_enabled
fi

ZEN_ENABLED=$(cat /tmp/zen_enabled)

if [ "$ZEN_ENABLED" = "0" ]; then
    echo "1" > /tmp/zen_enabled
    hyprctl hyprpaper wallpaper ,~/Pictures/nvimbg.png
    eww kill
    $HOME/.config/eww/scripts/openzen.sh
    notify-send "Zen mode enabled"
else
    echo "0" > /tmp/zen_enabled
    hyprctl hyprpaper wallpaper ,~/Pictures/campsite.jpg
    eww kill
    $HOME/.config/eww/scripts/open.sh
    notify-send "Zen mode disabled"
fi
