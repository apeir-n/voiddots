#!/bin/sh

xsetroot -cursor_name left_ptr
xsetroot -cursor_theme retrosmart
export XCURSOR_THEME="retrosmart-xcursor-black"
#xrandr --output eDP-1 --brightness 1.6
xcalib -a -red 0.9 0.1 95.0 -green 0.9 0.1 100.0 -blue 1.1 0.0 90.0
xscreensaver -no-splash &

xbindkeys &
picom &
paper &
dwmblocks &
mpd &
mpc_watch &
exec dwm
#exec twm
#exec fvwm3
#exec ctwm
