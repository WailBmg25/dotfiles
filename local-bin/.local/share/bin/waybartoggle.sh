#!/usr/bin/env sh
if pgrep -x waybar > /dev/null; then
    pkill -x waybar
else
    waybar &
fi
