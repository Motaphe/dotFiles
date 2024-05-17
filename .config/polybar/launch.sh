#!/bin/sh

# For HWMON Path
path1="/sys/devices/platform/coretemp.0/hwmon/hwmon6/temp1_input"
path2="/sys/devices/platform/coretemp.0/hwmon/hwmon7/temp1_input"

if [[ -f $path1 ]]; then
    export HWMON_PATH="$path1"
elif [[ -f $path2 ]]; then
    export HWMON_PATH="$path2"
else
    echo "Error: Temperature file not found."
fi


# Launch Polybar
if [ -z "$(pgrep -x polybar)" ]; then
    BAR="main"
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload $BAR &
        sleep 1
    done
else
    polybar-msg cmd restart
fi
