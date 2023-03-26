#!/bin/sh -e

# Take a screenshot
rm /tmp/lock_screen_images/screen_locked.png
scrot /tmp/lock_screen_images/screen_locked.png

# Pixellate it 10x
mogrify -scale 10% -scale 1000% /tmp/lock_screen_images/screen_locked.png

# Lock screen displaying this image.
i3lock -i /tmp/lock_screen_images/screen_locked.png

# Turn the screen off after a delay.
# sleep 60; pgrep i3lock && xset dpms force off
