#!/bin/sh

export XDG_RUNTIME_DIR=$(mkrundir)

export $(dbus-launch)

/usr/libexec/pipewire-launcher

exec i3
