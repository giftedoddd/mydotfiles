bluetooth_state=$(bluetooth)

if [[ $bluetooth_state == *"on"* ]]; then
	$(bluetooth off) > /dev/null
else
	$(bluetooth on) > /dev/null
fi
