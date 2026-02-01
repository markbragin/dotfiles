#!/bin/bash

locker_pid=$(ps -eo pid,cmd | rg -i "(\d+) i3lock" -or '$1')
if [ -z "$locker_pid" ]; then
    sound_running=$(cat /proc/asound/card*/pcm0p/sub0/status | rg -i running)
    lid_open=$(cat /proc/acpi/button/lid/LID0/state | rg -i open)
    if [ -z "$sound_running" ] || [ -z "$lid_open" ]; then
        lock
    fi
fi
