#!/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

dunst &
emacs --daemon=emacs &
nitrogen --restore &
picom --experimental-backend &

pasystray &
nm-applet &

trayer --edge top \
       --align right \
       --width 5 \
       --height 24 \
       --transparent true \
       --alpha 0 \
       --tint 0x282a36 \
       --padding 6 \
       --iconspacing 4 &

exec xmonad
