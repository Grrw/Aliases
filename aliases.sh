#!/bin/bash

bold=$(tput bold)
reg=$(tput sgr0)

defaulttext() {
    echo " ${bold}Aliases${reg}: steam-wine, dolphin-emu, microphone-listen, python, amazon, suspend"
    echo " Run with --[alias name] or -[abbreviation] to launch"
    echo " Run with -d for descriptions"
}


while [ "$1" != "" ]; do
case $1 in
        -d | --descriptions )
        printf "\n ${bold}steam-wine${reg} runs the steam client for Windows through wine.\n  Needs restart if computer goes to sleep or loses internet connectivity
            \n ${bold}dolphin-emu${reg} launches dolphin emulator for Windows through wine.
            \n ${bold}microphone-listen${reg} uses pactl to loop microphone audio through speakers
            \n ${bold}p${reg}: Shortcut for 'python3'
            \n ${bold}amazon${reg} removes the Ubuntu Amazon App (if it exists)
            \n ${bold}suspend${reg} suspends the computer with rofi prompt
            \n"
            # amazon is some Ubuntu default app
        exit;;

        --steam-wine | -sw )
            wine64 ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe "-nofriendsgui" -no-cef-sandbox
            exit;;

        # wineserver -k

        --dolphin-emu | -D )
            wine64 /media/ben/ExtraDrive1/Programs/Dolphin/Dolphin.exe
            exit;;

        --microphone-listen | -m )
            printf "This will listen to all audio from the microphone. \n-y to turn on; -n to turn off.\n"
            if [ "$2" == "-y" ]; then
                printf "MAKE SURE THE INPUT DEVICE'S VOLUME IS VERY LOW. \nOTHERWISE YOU MAY RUIN THE MICROPHONE PORT."
                pactl load-module module-loopback
            elif [ "$2" == "-n" ]; then
                printf "Microphone is no longer being loopbacked\n"
                pactl unload-module module-loopback
            fi
            exit;;
            
# Depreciated
#        --IntelliJ | -I )
#            /opt/IntelliJ/bin/./idea.sh
#            exit;;
        
#        --flash | -f )
#            ~/Documents/flashplayer
#            exit;;

# Removed; Not like 'python3' is hard to type
#        -p | --python )
#            if [ "$1" == "--python" ]; then
#                printf " Why did you go through all that hassle?\n Next time use -p.\n\n"
#            fi
#            # this if statement currently works if any number of flags up to 3 are given
#            # $ a -p main.py <options> || $ a -p main.py || $ a -p
#            # ignore the error messages
#            if [ $2 != "" ] || [ $2 != " " ]; then
#                if [ $3 != ""] || [ $2 != " " ]; then
#                    python3 "$2" "$3"
#                fi
#                python3 "$2"
#            else
#                python3
#            fi
#            exit;;

        --amazon | -a )
            sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
            exit;;

        --suspend | -s )
            systemctl suspend
            exit;;

        * )
        defaulttext
        exit;;

    esac
done

defaulttext
