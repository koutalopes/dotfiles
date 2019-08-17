#!/bin/bash

status=$(cat "/sys/class/power_supply/BAT0/status")
cap=$(cat "/sys/class/power_supply/BAT0/capacity")
chrg=$(cat "/sys/class/power_supply/BAT0/charge_now")

if [ "$status" == "Discharging" ]; then
    if [ "$cap" -lt 11 ]; then
        echo "%{F#FF9A9A}%{T3}%{T-}%{F-}"
        if [ "$chrg" == 297000 ]; then
            notify-send -u critical "$(echo -e "Bateria acabando!!\nFavor carregar!!")"
        fi
    elif [ "$cap" -gt 10 ] && [ "$cap" -lt 15 ]; then
        echo "%{F#04CED4}%{T3}%{T-}%{F-}"
    elif [ "$cap" -gt 14 ] && [ "$cap" -lt 40 ]; then
        echo "%{F#04CED4}%{T3}%{T-}%{F-}"
    elif [ "$cap" -gt 39 ] && [ "$cap" -lt 65 ]; then
        echo "%{F#04CED4}%{T3}%{T-}%{F-}"
    elif [ "$cap" -gt 64 ] && [ "$cap" -lt 90 ]; then
        echo "%{F#04CED4}%{T3}%{T-}%{F-}"
    else
        echo "%{F#04CED4}%{T3}%{T-}%{F-}"
    fi
else
    if [ "$cap" -lt 11 ]; then
        echo "%{F#FF0000}%{T3}%{T-}%{F-}"
    elif [ "$cap" -gt 10 ] && [ "$cap" -lt 15 ]; then
        echo "%{F#B3FFFF}%{T3}%{T-}%{F-}"
    elif [ "$cap" -gt 14 ] && [ "$cap" -lt 40 ]; then
        echo "%{F#B3FFFF}%{T3}%{T-}%{F-}"
    elif [ "$cap" -gt 39 ] && [ "$cap" -lt 65 ]; then
        echo "%{F#B3FFFF}%{T3}%{T-}%{F-}"
    elif [ "$cap" -gt 64 ] && [ "$cap" -lt 90 ]; then
        echo "%{F#B3FFFF}%{T3}%{T-}%{F-}"
    else
        echo "%{F#B3FFFF}%{T3}%{T-}%{F-}"
    fi
fi
