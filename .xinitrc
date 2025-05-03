#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
xinitdir=/etc/X11
sysresources=$xinitdir/Xresources
sysmodmap=$xinitdir/Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export XDG_RUNTIME_DIR=$(mkrundir)
export $(dbus-launch)

/usr/libexec/pipewire-launcher

exec i3
