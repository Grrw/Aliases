#!/bin/bash

# make a hotkey to this script

choice=$(echo -e "Cancel
Launch Steam (Wine)
Launch Dolphin Emulator (Wine)
Listen from Microphone Port
Kill Wineserver
Suspend Computer" | rofi -dmenu -mesg "What would you like to do?" -i -p "")

while [ "$choice" != "Cancel" ]; do
    case $choice in
        Launch\ Steam\ \(Wine\) )
            wine64 ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-cef-sandbox
        exit;;

        Launch\ Dolphin\ Emulator\ \(Wine\) )
            wine64 /media/ben/ExtraDrive1/Programs/Dolphin/Dolphin.exe
         exit;;

        Kill\ Wineserver )
            wineserver -k
        exit;;

        Listen\ from\ Microphone\ Port )
            listen=$(echo -e "Turn on Listening\nTurn off Listening" | rofi -dmenu -msg "MAKE SURE THE INPUT DEVICE'S VOLUME IS VERY LOW\nOTHERWISE YOU RISK RUINING THE MICROPHONE" -i -p "")

            [ "$listen" == "Turn on Listening" ] && pactl load-module module-loopback
            [ "$listen" == "Turn off Listening" ] && pactl unload-module module-loopback
        exit;;

        Suspend\ Computer )
            systemctl suspend
        exit;;

    esac
done

