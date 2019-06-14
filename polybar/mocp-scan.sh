#!/bin/sh

if [ "$(mocp -Q %state)" = "PLAY" ]; then
    echo "▶ 🎵"
elif [ "$(mocp -Q %state)" = "PAUSE" ]; then
    echo "|| 🎵"
else
    echo "■  🎵"
fi
