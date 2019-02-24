#!/bin/sh

# ln -s this into ~/.config/polybar/scripts
if [ "$(pgrep openvpn)" ]; then
    echo "🔗"
else
    echo "🌀"
fi
