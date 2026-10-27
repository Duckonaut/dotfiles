#!/usr/bin/env bash


PLAYER_COUNT=$(curl -s "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?key=$(cat $HOME/secrets/steam_webapi_key)&appid=1397790" | jq -r '.response.player_count')
PLAYER_COUNT=$(( $PLAYER_COUNT + $(curl -s "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?key=$(cat $HOME/secrets/steam_webapi_key)&appid=4375060" | jq -r '.response.player_count') ))

value() {
    echo $PLAYER_COUNT
}

expanded() {
    if [ "$PLAYER_COUNT" -gt 0 ]; then
        echo "true"
    else
        echo "false"
    fi
}

case "$1" in
    value)
        echo "$(value)"
        ;;
    expanded)
        echo "$(expanded)"
        ;;
    *)
        echo "Usage: $0 {value|expanded}"
        exit 2
esac
