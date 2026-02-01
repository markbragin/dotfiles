#!/bin/bash

filename="$1"
input="$(pactl get-default-sink).monitor"

ffmpeg -f pulse -i $input $filename
