#!/bin/bash

choice=$(rofi -dmenu -mesg "What would you like to do?" -i -p "" <<text
Cancel
Night Light
Toggle Polybar
Steam (Wine)
Dolphin Emulator (Wine)
Listen from Microphone Port
Kill Wineserver
Suspend Computer
text
)

case $choice in
    Night\ Light)
        if [ "$(pgrep nightlight)" ]; then
            killall nightlight
            xrandr --output eDP-1 --gamma 1:1:1
            notify-send "Nightlight Status" "Turned off"
        else
            notify-send "Nightlight Status" "Turned on"
            /usr/local/bin/nightlight
        fi
    ;;

    Toggle\ Polybar )
        /home/ben/Documents/alias/polybar/./launch-polybar.sh
    ;;

    Steam\ \(Wine\) )
        wine64 ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-cef-sandbox
    ;;

    Dolphin\ Emulator\ \(Wine\) )
        wine64 /media/ben/ExtraDrive1/Programs/Dolphin/Dolphin.exe
    ;;

    Kill\ Wineserver )
        wineserv=$(echo -e "No\nYes" | rofi -dmenu -mesg "Are you sure you want to kill the wineserver?" -i -p "")
            [ $wineserv == Yes ] && wineserver -k
    ;;

    Listen\ from\ Microphone\ Port )
        listen=$(echo -e "Turn on Listening\nTurn off Listening" | rofi -dmenu -mesg "MAKE SURE THE INPUT DEVICE'S VOLUME IS VERY LOW" -i -p "")
            [ "$listen" == "Turn on Listening" ] && pactl load-module module-loopback
            [ "$listen" == "Turn off Listening" ] && pactl unload-module module-loopback
    ;;

    Suspend\ Computer )
        sus=$(echo -e "No\nYes" | rofi -dmenu -mesg "Suspend Computer?" -i -p "")
            [ "$sus" == "Yes" ] && systemctl suspend
    ;;

esac
