#!/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout us -variant intl -option ctrl:nocaps
xsetroot -cursor_name left_ptr
xset s off; xset -dpms

emacs --daemon=emacs &
nitrogen --restore &
picom --experimental-backend &

killall -q polybar && polybar mybar &

blueman-applet &
flameshot &
nm-applet &
pasystray &

exec i3
