#!/usr/bin/bash

setxkbmap -layout us -variant intl -option ctrl:nocaps &

exec emacs
