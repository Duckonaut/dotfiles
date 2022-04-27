#!/bin/sh

ln -s ./awesome ~/.config/awesome
ln -s ./alacritty ~/.config/alacritty
ln -s .Xresources ~/.Xresources 
ln -s .tmux.conf ~/.tmux.conf 

# picom does not work with links, awesome launches it with a config from ~/repos/dotfiles/picom/picom.conf instead for now.
