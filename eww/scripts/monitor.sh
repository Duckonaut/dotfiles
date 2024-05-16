#!/bin/env bash

focusedmon=0

# Listen for current monitor
socat -u UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | rg --line-buffered "workspace|mon(itor)?" | while read -r line; do
  case ${line%>>*} in
    "focusedmon")
      focusedmon=$(echo "$line" | sed 's/.*>>//' | sed 's/,.*//')
      ;;
  esac
  hyprctl monitors -j | jq -r ".[] | select(.name == \"$focusedmon\") | .id"
done
