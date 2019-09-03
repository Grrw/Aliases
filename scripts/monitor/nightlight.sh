#!/bin/bash
# make a symlink called nightlight in /usr/local/bin/

turnoff=false

case "$1" in
    q )
        turnoff=true
esac

while true; do

    oldHr=$(date +"%H")
    printf "$oldHr\n"

    # if statment fixes bug where it was "day" from 00 to 01
    if [ $oldHr == 00 ]; then
        hour=0
    else
        hour=$(echo $oldHr | sed 's/^0*//')
    fi

    if (( $hour > 19 )) || (( $hour < 5 )); then
        # between 20:00 and 04:00
        printf "night"
        xrandr --output eDP-1 --gamma 1.1:0.8:0.7

    elif (( $hour == 19 )) || (( $hour == 5 )); then
        # at 19:00 and 05:00
        printf "transition"
        xrandr --output eDP-1 --gamma 1.0:0.9:0.8

    else
        # at any other time of day
        printf "day"
        xrandr --output eDP-1 --gamma 1:1:1
    fi

    printf "\n"

    if [ "$turnoff" = true ]; then
        break
    fi

    while [ $(date +"%H") == $oldHr ]; do
        sleep 5m
    done

done
