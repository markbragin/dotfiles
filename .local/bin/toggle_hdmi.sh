#!/usr/bin/env bash

export DISPLAY=:0
export XAUTHORITY=~/.Xauthority

if grep -wq "connected" /sys/class/drm/card1-HDMI-A-1/status; then
	~/.screenlayout/secondary.sh
else
	~/.screenlayout/primary.sh
fi

