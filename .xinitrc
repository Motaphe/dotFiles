#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Detect HDMI and eDP output names
HDMI_OUTPUT=$(xrandr | awk '/HDMI-.* connected/ {print $1}')
EDP_OUTPUT=$(xrandr | grep "eDP*" | awk '{print $1}')


# Set multi display configuration if HDMI is detected
if [ ! -z "$HDMI_OUTPUT" ]; then
	xrandr --output $HDMI_OUTPUT --mode 1920x1080 --rate 165 --primary --output $EDP_OUTPUT --mode 1920x1080 --rate 60 --left-of $HDMI_OUTPUT
fi

numlockx &
/usr/bin/prime-offload &
/usr/bin/emacs --daemon &
picom -b --config ~/.config/picom/picom.conf &
xsetroot -xcf /usr/share/icons/Catppuccin-Mocha-Peach-Cursors/cursors/left_ptr 16 &
~/.config/polybar/launch.sh &
nm-applet &
exec xmonad


