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
Compiling:
    pandoc filename.ext -t outputType -o output.ext                              Compiling
Images:
    ![name](path/to/file){ width=50% height=50% }                                Images
    By default this captions the image as a figure                               Images
    Appending a backslash to the end makes it a plain image                      Images
Header:
    ---                                                                          Header
    title:                                                                       Header
    -                                                                            Header
    author:                                                                      Header
    -                                                                            Header
    theme:                                                                       Header
    -                                                                            Header
    colortheme:                                                                  Header
    -                                                                            Header
    ---                                                                          Header
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


