#! /bin/bash

if pgrep -x "hypridle"; then
  killall hypridle >/dev/null
else
  hypridle >/dev/null &
fi

current_brightness=$(brightnessctl -q -sd asus::kbd_backlight get)

if [[ $current_brightness -eq 0 ]]; then
  target_brightness="1"
else
  target_brightness="0"
fi

sleep 1 && hyprctl dispatch dpms toggle
brightnessctl -r -q && brightnessctl -q -sd asus::kbd_backlight set $target_brightness
