#!/bin/bash

COMMAND_DURING_HOURS="/home/av32000/utils/set_light_mode.sh"
COMMAND_OFF_HOURS="/home/av32000/utils/set_dark_mode.sh"

current_hour=$(date +%H)
current_minute=$(date +%M)

current_hour=$((10#$current_hour))
current_minute=$((10#$current_minute))

START_HOUR=7
START_MINUTE=30
END_HOUR=21
END_MINUTE=0

if [[ ("$current_hour" -gt "$START_HOUR" || ("$current_hour" -eq "$START_HOUR" && "$current_minute" -ge "$START_MINUTE")) &&
  ("$current_hour" -lt "$END_HOUR" || ("$current_hour" -eq "$END_HOUR" && "$current_minute" -le "$END_MINUTE")) ]]; then
  eval "$COMMAND_DURING_HOURS"
else
  eval "$COMMAND_OFF_HOURS"
fi
