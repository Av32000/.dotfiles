#!/bin/bash

DEVICE="@DEFAULT_AUDIO_SINK@"

if ! command -v wpctl &> /dev/null; then
  echo "Error: wpctl not found. Please install WirePlumber."
  exit 1
fi

get_current_volume() {
  wpctl get-volume "$DEVICE" | awk '{print $2}'
}

set_volume() {
  vol="$1"
  if (( $(echo "$vol < 0.0" | bc -l) )); then
    vol=0.0
  elif (( $(echo "$vol > 1.5" | bc -l) )); then
    vol=1.5
  fi
  wpctl set-volume "$DEVICE" "$vol"
}

case "$1" in
  up)
    if [ -z "$2" ]; then
      echo "Usage: $0 up <percent>"
      exit 1
    fi
    cur=$(get_current_volume)
    inc=$(echo "$2 / 100" | bc -l)
    new=$(echo "$cur + $inc" | bc -l)
    set_volume "$new"
    ;;

  down)
    if [ -z "$2" ]; then
      echo "Usage: $0 down <percent>"
      exit 1
    fi
    cur=$(get_current_volume)
    dec=$(echo "$2 / 100" | bc -l)
    new=$(echo "$cur - $dec" | bc -l)
    set_volume "$new"
    ;;

  toggle)
    wpctl set-mute "$DEVICE" toggle
    ;;

  *)
    echo "Usage: $0 {up|down <int>|toggle}"
    exit 1
    ;;
esac
