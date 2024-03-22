#!/bin/sh

# Swap keys
setxkbmap -option caps:ctrl_modifier

# Disable access control
xhost +SI:localuser:$USER

# Set background color
xsetroot -solid "#000F14"

# Fallback cursor
xsetroot -cursor_name left_ptr

# Keyboard repeat rate
xset r rate 200 60

# Merge resources
xrdb -merge ~/.Xresources

# Disable screensaver and display power management
xset s off
xset s noblank
xset dpms 0 0 0
xset -dpms

# Fonts
fc-cache -rv
xset +fp $(dirname $(readlink -f ~/.guix-profile/share/fonts/truetype/fonts.dir))

# Setup Java
export JAVA18_PACKAGE="openjdk@18"
export JAVA18_PATH="$(guix build ${JAVA18_PACKAGE} | grep -- '-jdk$')"

# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

# Remove outdated compiled files
bin/remove-go-files

export SBCL_HOME=$(dirname $(which sbcl))/../lib/sbcl/
exec /home/enzuru/bin/stumpwm-boot
#exec openbox-session
