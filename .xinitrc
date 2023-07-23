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

/home/suz/.screenlayout/monitor_layout.sh &
exec xmonad &
/usr/lib/polkit-kde-authentication-agent-1 &
numlockx &
/usr/bin/prime-offload &
picom -b --config ~/.config/picom/picom.conf &
xsetroot -xcf /usr/share/icons/Catppuccin-Mocha-Peach-Cursors/cursors/left_ptr 16 &
/usr/bin/mpris-proxy &
sleep 2 && ~/.config/polybar/launch.sh &
nm-applet

