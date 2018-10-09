TOUCHPAD="Virtual core pointer"
SETTING="libinput Disable While Typing Enabled"


enable() {
    xinput --set-prop "SynPS/2 Synaptics TouchPad" 288 0
    echo "Touchpad enabled while typing"
}


disable() {
    xinput --set-prop "SynPS/2 Synaptics TouchPad" 288 1
    echo "Touchpad disabled while typing"
}


case "$1" in
    enable|e)
        enable
        exit;;

    disable|d)
        disable
        exit;;

    * )
        echo "enable or disable"
        ;;
esac