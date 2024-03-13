#!/bin/bash

locker_pid=$(ps -eo pid,cmd | rg -i "(\d+) i3lock" -or '$1')
if [ ! -n "$locker_pid" ]; then
    status=$(cat /proc/asound/card*/pcm0p/sub0/status | grep -i running)
    if [ ! -n "$status" ]; then
        lock
    fi
fi
