#!/bin/sh

xrandr --output DVI-I-0 \
	--mode 1920x1080 --pos 1920x0 --rotate normal \
	--output DVI-I-1 --off --output HDMI-0 --primary \
	--mode 1920x1080 \
	--pos 0x0 --rotate normal --output DP-0 --off \
	--output DP-1 --off

nitrogen --restore &
dunst &
# picom --experimental-backends &
nvidia-settings --load-config-only \
	--config /home/d0pa/.config/nvidia/nvidia-settings-rc &
nm-applet &
pasystray &
dwm_bar_time.sh &

sxhkd &

exec dwm
