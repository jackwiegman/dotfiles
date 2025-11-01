# SET ENVIRONMENTAL VARIABLES FOR ZSH SESSIONS

# ZSH HOME CONFIG DIRECTORY
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# XDG VARIABLES
# user-specific configuration files
export XDG_CONFIG_HOME="$HOME/.config"
# user-specific non-essintial (cached) data
export XDG_CACHE_HOME="$HOME/.cache"
# user-specific data files
export XDG_DATA_HOME="$HOME/.local/share"
# user-specific state data
export XDG_STATE_HOME="$HOME/.local/state"

# preference ordered base directories relative to which data files should be searched
# export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
# preference ordered base directories relative to which configuration files should be searched
# export XDG_CONFIG_DIRS="/etc/xdg/"
# user specific runtime files and other file objects
# export XDG_RUNTIME_DIR=


export HISTFILE="$XDG_CACHE_HOME/.zhistory"

export EDITOR="nvim" # Text based editor
export VISUAL="nvim" # Full screeen editor
export PAGER="bat" # idk if this one exists anywhere

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

# For texlive variables hopefully
export PATH="$PATH:/usr/local/texlive/2021/bin/x86_64-linux"

export MANPATH="$MANPATH:/usr/local/texlive/2021/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2021/texmf-dist/doc/info"
