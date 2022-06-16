#!/bin/env bash

lxsession &

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
