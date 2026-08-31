#!/usr/bin/env bash

PYTHON_MACRO="$HOME/GITHUB/MATEWMACRO/linuxvers/macro_engine.py"
MARKER_FILE="/tmp/macro_running"

# Toggle logic: If it's already running, turn it off
if [ -f "$MARKER_FILE" ]; then
    pkill -f "$PYTHON_MACRO"
    rm -f "$MARKER_FILE"
    pkill -RTMIN+8 waybar # Signal Waybar to refresh immediately
    exit 0
fi

# Otherwise, start it up
touch "$MARKER_FILE"
pkill -f "$PYTHON_MACRO"
python "$PYTHON_MACRO" &

# Signal Waybar to refresh immediately
pkill -RTMIN+8 waybar

# Wait for the macro to exit normally, then clean up if killed elsewhere
wait $!
rm -f "$MARKER_FILE"
pkill -RTMIN+8 waybar
