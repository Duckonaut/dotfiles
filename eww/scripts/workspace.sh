#!/usr/bin/env bash
# Proudly ripped off from https://github.com/fufexan/dotfiles

if [ -z "$1" ]; then
    monitor_index="0"
else
    monitor_index="$1"
fi

# get initial focused workspace
focusedws=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .activeWorkspace.id')

declare -A o=([1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 [7]=0 [8]=0 [9]=0 [10]=0 [11]=0 [12]=0 [13]=0 [14]=0 [15]=0 [16]=0 [17]=0 [18]=0 [19]=0 [20]=0)
declare -A monitormap
declare -A workspaces

# set color for each workspace
status() {
  if [ "${o[$1]}" -eq 1 ]; then
    if [ "$focusedws" -eq "$1" ]; then
      echo -n "focused"
    else
      echo -n "active"
    fi
  else
    echo -n "empty"
  fi
}

# handle workspace create/destroy
workspace_event() {
  o[$1]=$2
  while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | jq -r '.[]|"\(.id) \(.monitor)"')
}
# handle monitor (dis)connects
monitor_event() {
  while read -r k v; do monitormap["$k"]=$v; done < <(hyprctl -j monitors | jq -r '.[]|"\(.name) \(.id) "')
}

# get all apps titles in a workspace
applist() {
  ws="$1"

  apps=$(hyprctl -j clients | jaq -jr '.[] | select(.workspace.id == '"$ws"') | .title + "\\n"')
  echo -En "${apps%"\n"}"
}

# generate the json for eww
generate() {
  echo -n '['

  start=$((monitor_index * 10 + 1))
  end=$((start + 9))

  for i in $(seq "$start" "$end"); do
      echo -n ''"$([ "$i" -eq "$start" ] || echo ,)" '{ "number": "'"$i"'", "status": "'"$(status "$i")"'" }'
  done

  echo ']'
}

# setup

# add monitors
monitor_event

# add workspaces
while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | jq -r '.[]|"\(.id) \(.monitor)"')

# check occupied workspaces
for num in "${!workspaces[@]}"; do
  o[$num]=1
done
# generate initial widget
generate

# main loop
socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | rg --line-buffered "workspace|mon(itor)?" | while read -r line; do
  case ${line%>>*} in
    "workspace")
      focusedws=${line#*>>}
      ;;
    "focusedmon")
      focusedws=${line#*,}
      ;;
    "createworkspace")
      workspace_event "${line#*>>}" 1
      ;;
    "destroyworkspace")
      workspace_event "${line#*>>}" 0
      ;;
    "monitor"*)
      monitor_event
      ;;
  esac
  generate
done
