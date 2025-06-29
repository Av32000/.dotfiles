#!/bin/bash

# Allowed power profiles
profiles=("power-saver" "balanced" "performance")

# Get current profile
get_current_profile() {
  powerprofilesctl get
}

# Set power profile
set_profile() {
  profile=$1
  echo "Setting power profile to: $profile"
  powerprofilesctl set "$profile"
}

# If argument is passed, try to set it
if [ "$1" ]; then
  if [[ " ${profiles[*]} " == *" $1 "* ]]; then
    set_profile "$1"
  else
    echo "Invalid profile. Valid options: ${profiles[*]}"
    exit 1
  fi
else
  # Loop to next profile
  current=$(get_current_profile)
  case $current in
  power-saver)
    next="balanced"
    ;;
  balanced)
    next="performance"
    ;;
  performance)
    next="power-saver"
    ;;
  *)
    echo "Unknown current profile: $current"
    exit 1
    ;;
  esac
  set_profile "$next"
fi
