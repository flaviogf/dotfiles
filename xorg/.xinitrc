#!/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout us -variant intl -option ctrl:nocaps
xsetroot -cursor_name left_ptr

dunst &
emacs --daemon=emacs &
nitrogen --restore &
picom --experimental-backend &

blueman-applet &
flameshot &
nm-applet &
pasystray &

trayer --edge top \
       --widthtype request \
       --height 24 \
       --transparent true \
       --tint 0x282a36 \
       --alpha 0 \
       --iconspacing 2 &

exec xmonad
