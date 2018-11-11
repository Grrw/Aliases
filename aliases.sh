#!/bin/bash

bold=$(tput bold)
reg=$(tput sgr0)

defaulttext() {
    echo " ${bold}Aliases${reg}: steam-wine, dolphin-emu, microphone-listen, IntelliJ, mvp, google-music, flash, python, amazon"
    echo " Run with --[alias name] or -[abbreviation] to launch"
    echo " Run with -d for descriptions"
}


while [ "$1" != "" ]; do

    case $1 in
        -d | --descriptions ) # gross formatting
        printf "\n ${bold}steam-wine${reg} runs the steam client for Windows through wine.\n  Needs restart if computer goes to sleep or loses internet connectivity
            \n ${bold}dolphin-emu${reg} launches dolphin emulator for Windows through wine.
            \n ${bold}IntelliJ${reg} launches IntelliJ
            \n ${bold}mpv${reg} \"launches\" mpv
            \n ${bold}google-music${reg} launches Google Play Music Desktop Player\n  Same as 'google-play-music-desktop-player'
            \n ${bold}flash${reg} launches Adobe Standalone Flashplayer\n  Located in ~/Documents
            \n ${bold}p${reg}: Shortcut for 'python3'
            \n ${bold}clustertruck${reg} launches Clustertruck (needs external mouse)
            \n${bold}amazon${reg} removes amazon (if it exists)"
            # where does amaxon come from and why do I need to remove it?
        exit;;

        --steam-wine | -sw )
            wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-cef-sandbox
            exit;;

        # wineserver -k

        --dolphin-emu | -D )
            wine /media/ben/ExtraDrive1/Programs/Dolphin/Dolphin.exe
            exit;;

        --microphone-listen | -m )
            printf "This will listen to all audio from the microphone. \n-y to turn on; -n to turn off.\n"
            if [ "$2" == "-y" ]; then
                pactl load-module module-loopback
            elif [ "$2" == "-n" ]; then
                pactl unload-module module-loopback
            else
                printf "You did not supply a second argument.\n"
            fi
            exit;;
            

        --IntelliJ | -I )
            /opt/IntelliJ/bin/./idea.sh
            exit;;

        --mpv )
            printf "Just type 'mpv' you moron"
            exit;;

        --google-music | -gm )
            google-play-music-desktop-player
            exit;;
        
        --flash | -f )
            ~/Documents/flashplayer
            exit;;

        -p | --python )
            if [ "$1" == "--python" ]; then
                printf " Why did you go through all that hassle?\n Next time use -p.\n\n"
            fi
            # this if statement currently works if any number of flags up to 3 are given
            # $ a -p main.py <options> || $ a -p main.py || $ a -p
            # ignore the error messages
            if [ $2 != "" ] || [ $2 != " " ]; then
                if [ $3 != ""] || [ $2 != " " ]; then
                    python3 "$2" "$3"
                fi
                python3 "$2"
            else
                python3
            fi
            exit;;

        --amazon | -a )
            sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
            exit;;

        * )
        defaulttext
        exit;;

    esac
done

defaulttext
