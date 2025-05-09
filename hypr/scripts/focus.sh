if pgrep -x "waybar"; then
	pkill waybar > /dev/null
else
	waybar > /dev/null &
fi

if pgrep -x "hypridle"; then
	pkill hypridle > /dev/null
else
	hypridle > /dev/null &
fi

if pgrep -x "wpaperd"; then
	pkill wpaperd > /dev/null
else
	wpaperd -d > /dev/null &
fi
