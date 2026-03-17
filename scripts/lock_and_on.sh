#!/bin/bash
swaymsg "output * dpms on"
swaylock -f --clock --indicator --screenshots --effect-scale 0.2 --effect-vignette 0.3:0.8 --effect-blur 2x1 --datestr "%a %e.%m.%Y" --timestr "%k:%M"
