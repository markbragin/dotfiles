#!/usr/bin/env bash

# requirements: youtube-dl, eyeD3


if [ $# -lt 3 ]; then
    echo -e "Usage:"
    echo -e "\tmp3-from-yt <url> <song> <artist> [<album>]"
    echo -e "Use quotes if needed"
    exit 1
fi

url=$1
song=$2
artist=$3
album=$4
filename=$(echo ${song}-${artist} | sed 's/\(.*\)/\L\1/' | tr ' ' '_')

# download audio and save as filename.mpe
yt-dlp -x --audio-format mp3 --audio-quality 0 -o "$filename" $url
# update tags
eyeD3 "${filename}.mp3" -a "$artist" -t "$song" -A "$album"
