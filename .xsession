#!/bin/sh

# Swap keys
setxkbmap -option caps:ctrl_modifier

# Disable access control
xhost +SI:localuser:$USER

# Fallback cursor
xsetroot -cursor_name left_ptr

# Keyboard repeat rate
xset r rate 200 60

# Merge resources
xrdb -merge ~/.Xresources

# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

xsetroot -solid "#222833"

# Run services
SHEPHERD_PROC=$(ps -A | grep shepherd | wc --lines)
if [$SHEPHERD_PROC -lt 1]
then
    shepherd &
fi

MCRON_PROC=$(ps -A | grep mcron | wc --lines)
if [$MCRON_PROC -lt 1]
then
    mcron -d
fi

# Start Emacs
exec emacs
