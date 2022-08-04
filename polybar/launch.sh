#!/usr/bin/env bash

killall -q polybar

polybar mybar 2>&1 | tee -a /tmp/mybar.log & disown

echo "Bar launched"
