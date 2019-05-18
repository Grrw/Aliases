if [ "$(pidof polybar)" ]; then
    killall polybar
else
    if type "xrandr"; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload e &
      done
    else
      polybar --reload e &
    fi
fi

