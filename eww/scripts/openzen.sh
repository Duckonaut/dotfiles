#!/bin/env bash

ln -s -f "$HOME/.config/eww/scripts/colors-zen.scss" "$HOME/.config/eww/eww-colors.scss"

monitor_count=$(hyprctl monitors -j | jq -r 'length')

eww open bar0

if [ "$monitor_count" -gt 1 ]; then
    eww open bar1
fi

