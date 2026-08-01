#!/usr/bin/env sh
THRESHOLD=5  # pixels from bottom edge to trigger show

while true; do
    # get screen height and cursor Y position
    screenH=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
    curY=$(hyprctl cursorpos -j | jq '.y')

    if [ "$curY" -ge "$((screenH - THRESHOLD))" ]; then
        pgrep -x waybar > /dev/null || waybar &
    fi
    sleep 0.5
done
