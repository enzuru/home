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

# Setup Java
export JAVA18_PACKAGE="openjdk@18"
export JAVA18_PATH="$(guix build ${JAVA18_PACKAGE} | grep -- '-jdk$')"

# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

xsetroot -solid "#0c1014"

bin/remove-go-files

# Run services
SHEPHERD_PROC=$(ps -A | grep shepherd | wc --lines)
if (($SHEPHERD_PROC < 2));
then
    shepherd &
fi

MCRON_PROC=$(ps -A | grep mcron | wc --lines)
if (($MCRON_PROC < 2));
then
    mcron -d
fi

# Start Emacs
exec emacs
