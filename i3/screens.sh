#!/bin/sh

hdmi=$(xrandr -q | sed -n -e '/^HDMI-1/p')

if [[ "${hdmi:7:1}" == "d" ]]; then
    xrandr --output LVDS-1 --mode 1366x768 --rate 60 --output HDMI-1 --off && feh --randomize --bg-max ~/Imagens/*
else
    xrandr --output LVDS-1 --mode 1366x768 --rate 60 --output HDMI-1 --mode 1920x1080 --rate 60 --right-of LVDS-1 && feh --randomize --bg-max ~/Imagens/*
fi
