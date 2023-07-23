#!/bin/bash

# Detect HDMI and DP output names
HDMI_OUTPUT=$(xrandr | awk '/HDMI-.* connected/ {print $1}')
DP_OUTPUT=$(xrandr | awk '/DP-.* connected/ && !/eDP-.* connected/ {print $1}')
EDP_OUTPUT=$(xrandr | grep "eDP*" | awk '{print $1}')

# Function to turn on/off displays
function configure_displays() {
  local edp="$1"
  local hdmi="$2"
  local dp="$3"

  if [ -z "$hdmi" ] && [ -z "$dp" ]; then
    # No HDMI or DP, turn on eDP only
    xrandr --output $edp --auto --primary
  elif [ -n "$hdmi" ] && [ -z "$dp" ]; then
    # HDMI only, turn on HDMI and turn off eDP
    xrandr --output $edp --off --output $hdmi --primary --mode 1920x1080 --rate 240
  elif [ -n "$hdmi" ] && [ -n "$dp" ]; then
    # Both HDMI and DP, turn on HDMI and DP and turn off eDP
    xrandr --output $edp --off --output $dp --mode 1920x1080 --rate 240 --pos 1920x0 --rotate right --output $hdmi --primary --mode 1920x1080 --rate 165 --pos 0x375 --rotate normal
  else
    # DP only, turn on DP and turn off eDP
    xrandr --output $edp --off --output $dp --auto --primary
  fi
}

# Set multi-display configuration based on detected outputs
configure_displays "$EDP_OUTPUT" "$HDMI_OUTPUT" "$DP_OUTPUT"





