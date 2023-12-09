#!/bin/sh

# allow containers to access X
xhost +si:localuser:$USER

# not sure why, but without it, mozilla stuff is slow on startup(?)
exec dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
exec /usr/libexec/xdg-desktop-portal-gtk &

# set bg
~/.fehbg &

dwm 2> /tmp/dwm.log
