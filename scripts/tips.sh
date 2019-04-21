#!/bin/bash

choice=$(rofi -dmenu -i -p << options
Cancel
Pandoc Notes
options
)

case $choice in
    Pandoc\ Notes )
        panMem=$(echo -e "Insert Images:\n    ![name](path/to/file){ width=50% height=50% }\n    Appending a backslash makes it not a figure" | rofi -dmenu -i -p)
    ;;

esac


