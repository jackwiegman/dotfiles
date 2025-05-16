
#!/bin/bash

# Export standard environment variables
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland,x11
# export QT_STYLE_OVERRIDE=adwaita
# export SDL_VIDEODRIVER=wayland
# export CLUTTER_BACKEND=wayland

# Fix Java GUI apps (JetBrains, etc.)
export _JAVA_AWT_WM_NONREPARENTING=1

# Source user environment if needed (for GPG, etc.)
# [ -f ~/.pam_environment ] && source ~/.pam_environment

# Start dbus if not already running
if ! pgrep -x "dbus-daemon" > /dev/null; then
  eval "$(dbus-launch --sh-syntax)"
fi

# Start gnome-keyring components
# eval $(gnome-keyring-daemon --start --components=secrets,pkcs11)

# (Optional) Start xdg-desktop-portal for better Wayland app support
# Especially if you're using flatpaks or Electron apps
# You can run multiple backends but one should "take over"
# xdg-desktop-portal &
# xdg-desktop-portal-wlr &

# (Optional) Start a notification daemon
# dunst &

# (Optional) Launch wallpaper setter
# swww init &
# swww img ~/Pictures/wallpapers/default.jpg &

# Finally, launch Hyprland
exec Hyprland
