#!/bin/bash
MAX=125
CURRENT=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/{gsub(/%/,"",$5); print $5}')
if [ "$CURRENT" -lt "$MAX" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
fi
