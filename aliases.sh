#!/bin/bash

bold=$(tput bold)
reg=$(tput sgr0)

defaulttext() {
    echo " ${bold}Aliases${reg}: steam-wine, IntelliJ, mvp, JIPS, messengers, google-news, google-keep, google-music, flash, python, amazon"
    echo " Run with --[alias name] or -[abbreviation] to launch"
    echo " Run with -d for descriptions"
}

## COME BACK TO THIS ##
# case $2 in
#     "&" )
#         $hidden = $2
#         exit;;

#     * )
#         unset $hidden
#         exit;;
# esac

while [ "$1" != "" ]; do

    case $1 in
        -d | --descriptions ) # gross formatting
        printf "\n ${bold}steam-wine${reg} runs the steam client for Windows through wine.\n  Needs restart if computer goes to sleep or loses internet connectivity\n  ${bold}--steam-kill${reg} kills steam-wine
            \n ${bold}IntelliJ${reg} launches IntelliJ
            \n ${bold}mvp${reg} launches mpv
            \n ${bold}JIPS${reg} launches JIPS
            \n ${bold}google-news${reg} launches Google News as a standalone Electron App
            \n ${bold}google-keep${reg} launches Google Keep as a standalone Electron App"
            # google-news actually called news-google in /opt/
            # google news, keep created with nativefier
        printf "\n  Created with Nativefier
            \n ${bold}google-music${reg} launches Google Play Music Desktop Player\n  Same as 'google-play-music-desktop-player'
            \n ${bold}flash${reg} launches Adobe Standalone Flashplayer\n  Located in ~/Documents
            \n ${bold}p${reg}: Shortcut for 'python3'
            \n ${bold}clustertruck${reg} launches Clustertruck (needs external mouse)
            \n${bold}amazon${red} removes amazon (if it exists)" # why
        exit;;

        --steam-wine | -sw )
            wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe >/dev/null 2>&1
            exit;;
        --steam-kill | -sk )
            wineserver -k
            exit;;

        --IntelliJ | -I )
            /opt/IntelliJ/bin/./idea.sh
            exit;;

        --JIPS | -J )
            java -jar /opt/JIPS/JIPS.jar
            exit;;

        --google | -g )
            /opt/google-keep/./Keep & google-play-music-desktop-player
            exit;;
        --google-keep | -gk )
            /opt/google-keep/./Keep
            exit;;
        --google-music | -gm )
            google-play-music-desktop-player
            exit;;
        
        --flash | -f )
            ~/Documents/flashplayer
            exit;;

        -p )
            if [ $2 != "" ] || [ $2 != " " ]; then
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
