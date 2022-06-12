#!/usr/bin/env bash

# Xmonad
rm -rf /home/flaviogf/.xmonad &&
    mkdir -p /home/flaviogf/.xmonad &&
    ln -s /home/flaviogf/dev/dotfiles/xmonad/xmonad.hs /home/flaviogf/.xmonad/xmonad.hs

# Xmobar
rm -rf /home/flaviogf/.xmobarrc &&
    ln -s /home/flaviogf/dev/dotfiles/xmobar/.xmobarrc /home/flaviogf/.xmobarrc
