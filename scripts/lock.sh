#!/bin/bash

revert() {
    xset dpms 0 0 0
    kill $!
}

suspend_in_background() {
    while true; do
        status=$(xset q | rg "Monitor is (\w+)" -or '$1')
        if [ $status == "Off" ]; then
            systemctl suspend
        fi
        sleep 5
    done
}

trap revert HUP INT TERM

revert
xset dpms 30 30 600
playerctl -a pause
suspend_in_background &
i3lock -e -u -n -f -c 000000 -i ~/Pictures/wallpaper.png
revert
