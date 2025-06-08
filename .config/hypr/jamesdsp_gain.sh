#!/bin/bash

# Path to JamesDSP config (adjust if yours is different)
CONFIG_FILE="$HOME/.config/jamesdsp/audio.conf"

# The JamesDSP parameter for post gain
# GAIN_PARAMETER="master_postgain"
GAIN_PARAMETER="master_postgain"

# Function to get current post gain
get_current_gain() {
    # Extract the value after "master_postgain=" from the config file
    grep -oP "${GAIN_PARAMETER}=\K[0-9.-]+" "$CONFIG_FILE" || echo "0.0"
}

# Function to set post gain via jamesdsp CLI
set_gain() {
    jamesdsp --set "${GAIN_PARAMETER}=$1"
}

CURRENT_GAIN=$(get_current_gain)
INCREMENT=0.5 # Adjust the increment/decrement step as needed (e.g., 0.1, 1.0)

case "$1" in
    "increase")
        NEW_GAIN=$(echo "$CURRENT_GAIN + $INCREMENT" | bc -l)
        ;;
    "decrease")
        NEW_GAIN=$(echo "$CURRENT_GAIN - $INCREMENT" | bc -l)
        ;;
    *)
        echo "Usage: $0 [increase|decrease]"
        exit 1
        ;;
esac

# Optional: Add limits to the gain (adjust MAX_GAIN and MIN_GAIN as desired)
# Default range in JamesDSP is often -10 dB to +10 dB, but can vary.
MAX_GAIN=10.0
MIN_GAIN=-15.0

if (( $(echo "$NEW_GAIN > $MAX_GAIN" | bc -l) )); then
    NEW_GAIN=$MAX_GAIN
elif (( $(echo "$NEW_GAIN < $MIN_GAIN" | bc -l) )); then
    NEW_GAIN=$MIN_GAIN
fi

# Apply the new gain
set_gain "$NEW_GAIN"

# Optional: Send a notification using dunstify
# Make sure dunst is installed if you want notifications.
# You can uncomment the line below:
# dunstify -a "JamesDSP" "Post Gain" "Set to ${NEW_GAIN} dB"
