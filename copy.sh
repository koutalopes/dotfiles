#!/bin/bash

shopt -s extglob

dot=$1

if [[ "$dot" == "all" ]]; then
    rm -r !(README.md|copy.sh)
    cp -r $XDG_CONFIG_HOME/{awesome,dunst,i3,mpv,neofetch,nvim,polybar,ranger,rofi,termite,compton.conf} $HOME/Scripts/dotfiles
else
    rm -r $HOME/Scripts/dotfiles/"$dot"
    cp -r $XDG_CONFIG_HOME/"$dot" $HOME/Scripts/dotfiles
fi

