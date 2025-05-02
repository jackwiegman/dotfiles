# SET ENVIRONMENTAL VARIABLES FOR ZSH SESSIONS

# ZSH HOME CONFIG DIRECTORY
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# XDG VARIABLES
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/statwe"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CONFIG_DIRS="/etc/xdg/"


export HISTFILE="$XDG_CACHE_HOME/.zhistory"

export EDITOR="nvim"
export VISUAL="nvim"

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
