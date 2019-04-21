#!/bin/bash

# short script to list mocp song currently playing

name=$(mocp -Q %file)

IFS='|' read -a ARR <<< "$name"

notify-send "Now Playing" "$(printf "${ARR[1]}\n" && printf "Time Left: " && mocp -Q %tl)"


unset IFS


