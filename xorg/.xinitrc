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
pasystray &
nm-applet &

trayer --edge top \
       --align right \
       --width 5 \
       --height 24 \
       --transparent true \
       --alpha 0 \
       --tint 0x282a36 \
       --distance 340 \
       --distancefrom right \
       --padding 2 \
       --iconspacing 2 &

exec xmonad
