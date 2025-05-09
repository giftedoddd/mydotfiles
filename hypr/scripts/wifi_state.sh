current_state=$(wifi)

if [[ $current_state == *"on"* ]]; then
	$(wifi off) > /dev/null
else
	$(wifi on) > /dev/null
fi
