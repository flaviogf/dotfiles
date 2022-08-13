#!/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout us -variant intl -option ctrl:nocaps
xsetroot -cursor_name left_ptr

emacs --daemon=emacs &
nitrogen --restore &
picom --experimental-backend &

killall -q polybar && polybar mybar &

blueman-applet &
flameshot &
nm-applet &
pasystray &

x11vnc -display :0 -forever &

exec i3
