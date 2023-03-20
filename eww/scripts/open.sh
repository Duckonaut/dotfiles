#!/bin/env bash

monitor_count=$(hyprctl monitors -j | jq -r 'length')

eww open bar0

if [ "$monitor_count" -gt 1 ]; then
    eww open bar1
fi
