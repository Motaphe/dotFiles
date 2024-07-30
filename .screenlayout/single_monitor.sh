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

  xrandr --output $edp --off --output $dp --off --output $hdmi --primary --mode 2560x1440 --rate 144
}

# Set multi-display configuration based on detected outputs
configure_displays "$EDP_OUTPUT" "$HDMI_OUTPUT" "$DP_OUTPUT"





