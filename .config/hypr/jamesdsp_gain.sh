#!/bin/bash

case "$1" in
    "increase")
	pactl set-sink-input-volume $(pactl list sink-inputs | grep -B 20 "application.name = \"jamesdsp\"" | awk '/Sink Input #/{sub(/#/, "", $3); print $3}') +5%
        ;;
    "decrease")
	pactl set-sink-input-volume $(pactl list sink-inputs | grep -B 20 "application.name = \"jamesdsp\"" | awk '/Sink Input #/{sub(/#/, "", $3); print $3}') -5%
        ;;
    *)
        echo "Usage: $0 [increase|decrease]"
        exit 1
        ;;
esac

