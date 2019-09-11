#!/bin/bash

shopt -s extglob

dot=$1

if [[ "$dot" == "all" ]]; then
    rm -r !(README.md|copy.sh)
    cp -r $XDG_CONFIG_HOME/{dunst,i3,mpv,neofetch,nvim,polybar,ranger,rofi,termite,compton.conf} $HOME/dotfiles
else
    rm -r $HOME/dotfiles/"$dot"
    cp -r $XDG_CONFIG_HOME/"$dot" $HOME/dotfiles
fi

