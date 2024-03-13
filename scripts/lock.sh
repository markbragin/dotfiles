#!/bin/bash

i3lock -e -u -f -c 000000 -i ~/Pictures/wallpaper.png &

sleep 60
locker_pid=$(ps -eo pid,cmd | rg -i "(\d+) i3lock" -or '$1')
kill -0 $locker_pid && xset dpms force suspend

sleep 600
locker_pid=$(ps -eo pid,cmd | rg -i "(\d+) i3lock" -or '$1')
kill -0 $locker_pid && systemctl suspend
