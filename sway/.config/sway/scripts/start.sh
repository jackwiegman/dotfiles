#!/bin/bash

# Session/Desktop env variables
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export GDK_BACKEND=wayland,x11
export QT_QPA_PLATFORM=wayland

# XDG portal

# Fix Java GUI apps (JetBrains, etc.)
export _JAVA_AWT_WM_NONREPARENTING=1

# Start dbus if not already running
if ! pgrep -x "dbus-daemon" > /dev/null; then
  eval "$(dbus-launch --sh-syntax)"
fi

exec sway --unsuported-gpu
