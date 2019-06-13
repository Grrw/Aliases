#!/bin/bash

choice=$(rofi -dmenu -i -p << options
Cancel
pandoc
xrandr
options
)

# appending the option at the end of a line: it will show up when you type it

case $choice in
    pandoc)
mem=$(rofi -dmenu -i -p << pan
Inserting Images:
    ![name](path/to/file){ width=50% height=50% }                           Inserting Images
    By default this captions the image as a figure                          Inserting Images
    Appending a backslash to the end makes it a plain image                 Inserting Images
Making a Header:
    ---                                                                     Making a Header
    title:                                                                  Making a Header
    -                                                                       Making a Header
    author:                                                                 Making a Header
    -                                                                       Making a Header
    theme:                                                                  Making a Header
    -                                                                       Making a Header
    colortheme:                                                             Making a Header
    -                                                                       Making a Header
    ---                                                                     Making a Header
pan
)
;;

xrandr )
    mem=$(rofi -dmenu -i -p << xran
xrandr --current --verbose | grep Brightness
xrandr --output eDP-1 --brightness 1.0
xran
)
        
;;


esac


