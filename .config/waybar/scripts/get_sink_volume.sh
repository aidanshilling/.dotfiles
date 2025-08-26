#!/bin/bash

# Replace this with the exact name of your desired sink
TARGET_SINK="JamesDSP" # Example: your headphones

get_sink_volume_json() {
	# Get the volume of the target sink
	# This part might need slight adjustment based on your 'pactl list sinks' output
	# The goal is to extract the percentage value.
	VOLUME=$(pamixer --sink $TARGET_SINK --get-volume)

	# Check if the sink is muted
	MUTED=$(pamixer --sink 0 --get-mute)

	# Set an icon based on volume or mute status
	ICON="" # Default icon
	if [ "$MUTED" == "true" ]; then
	    ICON=""
	    VOLUME=0 # Or keep the last volume before mute if you prefer
	elif [ -z "$VOLUME" ]; then
	    # If volume is empty, sink might not be found or active
	    ICON=""
	    VOLUME="N/A"
	elif (( $(echo "$VOLUME < 50" | bc -l) )); then
	    ICON=""
	elif (( $(echo "$VOLUME < 70" | bc -l) )); then
	    ICON=""
	fi

	# Output in JSON format for Waybar
	# Including 'percentage' for potential format-icons in Waybar
	echo "{\"text\": \"$VOLUME% $ICON \", \"tooltip\": \"Volume for $TARGET_SINK\", \"percentage\": $VOLUME, \"class\": \"$MUTED\"}"
}

get_sink_volume_json

pactl subscribe | grep --line-buffered "sink" | while read -r event; do
	get_sink_volume_json
done
