#!/bin/bash

duration=0
msg=""

if [[ $3 ]]; then
    duration=$(( $1 * 3600 + $2 * 60 + $3 ))
    printf -v msg "%02d:%02d:%02d" "$1" "$2" "$3"
elif [[ $2 ]]; then
    duration=$(( $1 * 60 + $2 ))
    printf -v msg "00:%02d:%02d" "$1" "$2"
elif [[ $1 ]]; then
    duration=$1
    printf -v msg "00:00:%02d" "$1"
else
    exit 1
fi

sleep "$duration" && notify-send -u Critical "Timer expired: $msg"
sound_path=~/Music/ttimer.ogg
paplay $sound_path
