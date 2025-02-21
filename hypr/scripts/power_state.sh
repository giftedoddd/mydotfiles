#!/bin/bash

power_status=$(cat ) # Path to your power supply e.g /sys/class/power_supply/ADP1/online

if [ "$power_status" -eq 1 ]; then
    cp # Performance mode config
else 
    cp # Powersave mode config
fi
