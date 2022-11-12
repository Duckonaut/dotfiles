#!/bin/sh

ln -s -f "$PWD/awesome" "$HOME/.config/awesome"
ln -s -f "$PWD/alacritty" "$HOME/.config/alacritty"
ln -s -f "$PWD/.Xresources" "$HOME/.Xresources"
ln -s -f "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -s -f "$PWD/wayland/hypr" "$HOME/.config/hypr"
ln -s -f "$PWD/wayland/wofi" "$HOME/.config/wofi"
ln -s -f "$PWD/wayland/waybar" "$HOME/.config/waybar"

# picom does not work with links, awesome launches it with a config from ~/repos/dotfiles/picom/picom.conf instead for now.
