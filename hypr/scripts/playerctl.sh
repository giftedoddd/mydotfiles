#!/bin/bash

ACTION="$1"

case "$ACTION" in
next)
    CMD="next"
    message="🎵 Jumping to next music."
    hyprctl notify 6 3000 0 $message
    ;;
prev)
    CMD="previous"
    message="🎵 Jumping to previous music."
    hyprctl notify 6 3000 0 $message
    ;;
play)
    CMD="play"
    message="🎵 Playing music."
    hyprctl notify 6 3000 0 $message
    ;;
pause)
    CMD="pause"
    message="🎵 Pausing music."
    hyprctl notify 6 3000 0 $message
    ;;
*)
    echo "Usage: $0 {n|p|play}"
    exit 1
    ;;
esac

bluetoothctl <<EOF
menu player
$CMD
EOF
