#!/bin/bash

bold=$(tput bold)
reg=$(tput sgr0)

defaulttext() {
    echo " ${bold}Aliases${reg}: update-clean, steam-wine, eclipse, JIPS, whatsapp, messengers, google-news, google-keep, google-music, flash, p, gs, gc, gcc, ga, gp, gpp, clustertruck"
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
        printf "\n ${bold}update-clean${reg} first asks for perms\n  Then runs apt-get upgrade, update, autoremove, and autoclean
            \n ${bold}steam-wine${reg} runs the steam client for Windows through wine.\n  Needs restart if computer goes to sleep or loses internet connectivity\n  ${bold}--steam-kill${reg} kills steam-wine
            \n ${bold}eclipse${reg} launches Eclipse Oxygen (asks for perms)
            \n ${bold}JIPS${reg} launches JIPS
            \n ${bold}whatsapp${reg} launches WhatsApp Messenger
            \n ${bold}messengers${reg} launches all Messengers:\n  Whatsapp, Telegram, Signal
            \n ${bold}google-news${reg} launches Google News as a standalone Electron App
            \n ${bold}google-keep${reg} launches Google Keep as a standalone Electron App"
            # google-news actually called news-google in /opt/
            # google news, keep created with nativefier
        printf "\n  Created with Nativefier
            \n ${bold}google-music${reg} launches Google Play Music Desktop Player\n  Same as 'google-play-music-desktop-player'
            \n ${bold}flash${reg} launches Adoble Standalone Flashplayer\n  Located in ~/Documents
            \n ${bold}p${reg}: Shortcut for 'python3'
            \n ${bold}gs${reg}: 'git status'    | ${bold}gc${reg}: 'git clone'\n ${bold}ga${reg}: 'git add'       | ${bold}gp${reg}: 'git pull'\n ${bold}gcc${reg} 'git commit -m' | ${bold}gpp${reg} 'git push'
            \n ${bold}clustertruck${reg} launches Clustertruck (needs external mouse)
            \n"
        exit;;

        --update-clean | -uc )
            for action in update upgrade autoclean autoremove; do
                sudo
                printf "${bold}$action${reg}"; sleep 2s
                sudo apt-get $action
            done
            exit;;

        --steam-wine | -sw )
            wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe >/dev/null 2>&1
            exit;;
        --steam-kill | -sk )
            wineserver -k
            exit;;

        --eclipse | -e )
            sudo /opt/eclipse/./eclipse
            exit;;

        --JIPS | -J )
            java -jar /opt/JIPS/JIPS.jar
            exit;;

        --whatsapp | -w )
            /opt/whatsapp/./WhatsApp
            exit;;

        --messengers | -m )
            signal-desktop & telegram-desktop & /opt/whatsapp/./WhatsApp
            exit;;
        
        --google-news | -gn )
            /opt/news-google/./news-google
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

        -ga )
            git add "$2"
            exit;;
        -gs )
            git status
            exit;;
        -gc )
            git clone "$2"
            exit;;
        -gcc )
            git commit -m "$2"
            exit;;
        -gp )
            git pull "$2"
            exit;;
        -gpp )
            git push
            exit;;
        
        --clustertruck | -c )
            media/ben/ExtraDrive1/Programs/Clustertruck/./start.sh
            exit;;

        * )
        defaulttext
        exit;;

    esac
done

defaulttext
