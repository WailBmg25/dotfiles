if [[ $(hyprctl activewindow -j | jq -r ".class") == "Steam" ]]; then
    xdotool windowunmap $(xdotool getactivewindow)
else
    hyprctl eval "hl.dispatch(hl.dsp.window.close())"
fi
