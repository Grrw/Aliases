#!/bin/bash

# sed commands:
# remove "Music/" and anything before it
# replace any numbers followed by a whitespace and pipe (e.g. "03 |") with " -"
    # There is a whitespace after |, so this makes " - "
# replace any slashes with ": "
# remove all characters following a period

# This parses filenames from /home/ into something nice to read
# ...but they must follow this syntax:
#  /Music/Artist/Album/number | Songname.format

name=$(mocp -Q %file | sed "s/.*Music\///g;s/\/[0-9]*\s|/ -/g;s/\//: /g;s/\..*//g")

notify-send "Time Elapsed: `mocp -Q %ct`/`mocp -Q %tt`" "$name"

