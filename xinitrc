#!/bin/sh

export XCURSOR_THEME="retrosmart-xcursor-black"
xsetroot -cursor_name left_ptr
xsetroot -cursor_theme retrosmart
xrandr --output eDP-1 --brightness $(slcat $HOME/.cache/scripts/brandr)
xcalib -a -red 0.9 0.1 95.0 -green 0.9 0.1 100.0 -blue 1.1 0.0 90.0
xset b off
xset dpms 1200 1800 2400

xscreensaver -no-splash &
xbindkeys &
picom &
paper &
dwmblocks &
mpd &
mpc_watch &
exec dwm
