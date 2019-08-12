#!/bin/bash

rm -fr $HOME/Scripts/dotfiles/{dunst,i3,mpv,polybar,rofi,systemd,compton.conf,Xresources}

cp -fr $XDG_CONFIG_HOME/{dunst,i3,mpv,polybar,rofi,systemd,compton.conf} $HOME/Scripts/dotfiles
cp -f $HOME/.Xresources $HOME/Scripts/dotfiles/Xresources
