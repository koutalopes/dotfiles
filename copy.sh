#!/bin/bash

dot=$1

rm -fr $HOME/Scripts/dotfiles/"$dot"

if [[ "$dot" == "Xresources" ]]; then
    cp -f $HOME/.Xresources $HOME/Scripts/dotfiles/"$dot"
else
    cp -fr $XDG_CONFIG_HOME/"$dot" $HOME/Scripts/dotfiles
fi

