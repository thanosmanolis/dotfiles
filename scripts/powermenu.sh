#!/bin/bash

shutdown=""
reboot=""
suspend="󰤄"
lock=""
logout="󰍃"

chosen=$(printf "$shutdown\n$reboot\n$suspend\n$lock\n$logout" | rofi -dmenu -p "Power" -theme-str '
window {
    width: 400px;
    height: 300px;
    border-radius: 10px;
}
listview {
    lines: 5;
    layout: horizontal;
    spacing: 10px;
}
element {
    padding: 20px;
    border-radius: 8px;
    font: "Font Awesome 6 Free 20";
}
element selected {
    background-color: #00897b;
}
inputbar { enabled: false; }
')

case $chosen in
    "$shutdown") systemctl poweroff ;;
    "$reboot") systemctl reboot ;;
    "$suspend") systemctl suspend ;;
    "$lock") swaylock -f --effect-blur 10x3 ;;
    "$logout") swaymsg exit ;;
esac
