#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/System/Wallpaper"
COUNT=$(ls "$WALLPAPER_DIR" 2>/dev/null | wc -l)

if [ "$COUNT" -eq 0 ]; then
    echo "Error: No wallpaper found in $WALLPAPER_DIR"
    swaymsg "output * bg #1a1a2e solid_color"
elif [ "$COUNT" -gt 1 ]; then
    echo "Error: More than one file in $WALLPAPER_DIR, please keep only one"
    swaymsg "output * bg #1a1a2e solid_color"
else
    WALLPAPER=$(ls "$WALLPAPER_DIR")
    swaymsg "output * bg $WALLPAPER_DIR/$WALLPAPER fill"
fi
