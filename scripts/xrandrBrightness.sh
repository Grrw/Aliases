#!/bin/bash

brightVal=$(xrandr --verbose | grep Brightness | grep -o '[0-9].*')

if [ "$1" != "" ]; then

    if [ "$1" == "up" ]; then
        xrandr --output eDP-1 --brightness $(echo "$brightVal+0.1" | bc)
    elif [ "$1" == "dn" ]; then
        xrandr --output eDP-1 --brightness $(echo "$brightVal-0.1" | bc)
    fi
    
else
    xrandr --output eDP-1 --brightness 1.0
fi
