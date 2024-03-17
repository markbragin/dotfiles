#!/bin/bash

locker_pid=$(ps -eo pid,cmd | rg -i "(\d+) i3lock" -or '$1')
if [ -z "$locker_pid" ]; then
    status=$(cat /proc/asound/card*/pcm0p/sub0/status | grep -i running)
    if [ -z "$status" ]; then
        lock
    fi
fi