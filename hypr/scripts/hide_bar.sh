#!/bin/bash

if pgrep -x "waybar"; then
    pkill waybar
else
    waybar > /dev/null &
fi
