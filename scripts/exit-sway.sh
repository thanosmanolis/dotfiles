#!/bin/bash
pkill -x waybar 2>/dev/null || true
pkill -x mako 2>/dev/null || true
pkill -x swayidle 2>/dev/null || true
pkill -x blueman-applet 2>/dev/null || true
pkill -x nm-applet 2>/dev/null || true
sleep 0.5
swaymsg exit
