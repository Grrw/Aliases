if [ "$(pidof polybar)" ]; then
    pgrep polybar | xargs kill -9
else
    if type "xrandr"; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload e &
      done
    else
      polybar --reload e &
    fi
fi

