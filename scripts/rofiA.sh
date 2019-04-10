#!/bin/bash

# make a hotkey to this script

#choice=$(echo -e \
#"Cancel
#Launch Steam (Wine)
#Launch Dolphin Emulator (Wine)
#Listen from Microphone Port
#Kill Wineserver
#Suspend Computer" | rofi -dmenu -mesg "What would you like to do?" -i -p "")


choice=$(rofi -dmenu -mesg "What would you like to do?" -i -p "" <<stam
Cancel
Launch Steam (Wine)
Launch Dolphin Emulator (Wine)
Listen from Microphone Port
Kill Wineserver
Suspend Computer
stam
)

case $choice in
    Launch\ Steam\ \(Wine\) )
        wine64 ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-cef-sandbox
    exit;;

    Launch\ Dolphin\ Emulator\ \(Wine\) )
        wine64 /media/ben/ExtraDrive1/Programs/Dolphin/Dolphin.exe
     exit;;

    Kill\ Wineserver )
        wineserv=$(echo -e "No\nYes" | rofi -dmenu -mesg "Are you sure you want to kill the wineserver?" -i -p "")
            [ $wineserv == Yes ] && wineserver -k
    exit;;

    Listen\ from\ Microphone\ Port )
        listen=$(echo -e "Turn on Listening\nTurn off Listening" | rofi -dmenu -mesg "MAKE SURE THE INPUT DEVICE'S VOLUME IS VERY LOW" -i -p "")
            [ "$listen" == "Turn on Listening" ] && pactl load-module module-loopback
            [ "$listen" == "Turn off Listening" ] && pactl unload-module module-loopback
    exit;;

    Suspend\ Computer )
        sus=$(echo -e "No\nYes" | rofi -dmenu -mesg "Suspend Computer?" -i -p "")
            [ "$sus" == "Yes" ] && systemctl suspend
    exit;;

esac

