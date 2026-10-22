#!/usr/bin/env sh

# enable float
WinFloat=$(hyprctl -j clients | jq '.[] | select(.focusHistoryID == 0) | .floating')
WinPinned=$(hyprctl -j clients | jq '.[] | select(.focusHistoryID == 0) | .pinned')

if [ "${WinFloat}" == "false" ] && [ "${WinPinned}" == "false" ] ; then
    hyprctl eval "hl.dispatch(hl.dsp.window.float())"
fi

# toggle pin
hyprctl eval "hl.dispatch(hl.dsp.window.pin())"

# disable float
WinFloat=$(hyprctl -j clients | jq '.[] | select(.focusHistoryID == 0) | .floating')
WinPinned=$(hyprctl -j clients | jq '.[] | select(.focusHistoryID == 0) | .pinned')

if [ "${WinFloat}" == "true" ] && [ "${WinPinned}" == "false" ] ; then
    hyprctl eval "hl.dispatch(hl.dsp.window.float())"
fi

