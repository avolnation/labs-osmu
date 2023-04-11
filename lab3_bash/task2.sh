#!/bin/bash

# Check if process name is provided as an argument
if [ -z "$1" ]; then
  echo "Error: Process name not provided."
  exit 1
fi

process_name="$1"

# Terminate processes gracefully with SIGTERM signal
pkill -TERM "$process_name"

# Check if any processes are terminated
if [ $? -eq 0 ]; then
  echo "Processes terminated: $(pgrep -d, "$process_name")"
else
  echo "Error: No processes found with the name '$process_name'"
  exit 1
fi