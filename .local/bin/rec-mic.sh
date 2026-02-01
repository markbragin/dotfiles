#!/bin/bash

filename="$1"

ffmpeg -f pulse -i default $filename
