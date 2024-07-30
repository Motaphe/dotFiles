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

  xrandr --output $edp --auto --pos 3640x720 --output $dp --mode 1920x1080 --rate 165 --pos 2560x0 --rotate left --output $hdmi --primary --mode 2560x1440 --rate 144 --pos 0x240 --rotate normal
}

# Set multi-display configuration based on detected outputs
configure_displays "$EDP_OUTPUT" "$HDMI_OUTPUT" "$DP_OUTPUT"





