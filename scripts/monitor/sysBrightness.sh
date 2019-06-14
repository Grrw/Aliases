#!/bin/bash
# make a symlink called sysBrightness in /usr/local/bin/
# hotkeys must be run as sudo, the sudoers file configure-brightness helps with this

if [ "$1" != "" ]; then

    if [ "$1" == "up" ];then
        echo "$(echo "$(cat /sys/class/backlight/intel_backlight/brightness)+150" | bc)" > /sys/class/backlight/intel_backlight/brightness

    elif [ "$1" == "dn" ];then
        echo "$(echo "$(cat /sys/class/backlight/intel_backlight/brightness)-150" | bc)" > /sys/class/backlight/intel_backlight/brightness
    fi

else
    ## This is here for KDE hotkey compatibility, you cannot have arguments for scripts
    echo "$(echo "$(cat /sys/class/backlight/intel_backlight/brightness)+150" | bc)" > /sys/class/backlight/intel_backlight/brightness
fi

