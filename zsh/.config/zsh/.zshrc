
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-._-]=** r:|=**'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '%e Errors found'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/jack/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zshhistory
HISTSIZE=2000
SAVEHIST=2000
bindkey -v
# End of lines configured by zsh-newuser-install

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# Aliases

source $ZDOTDIR/aliases.zsh
# ADD PATH VARIABLES
# path=(~/.local/bin $path)
path=(/usr/bin/node $path)
# Plugin Mangager
##? Clone a plugin, identify its init file, source it, and add it to your fpath.
function plugin-load {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        git@github.com:$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

repos=(
    # romkatv/powerlevel10k

    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting

    ## Extra vim mode stuff
    #
    softmoth/zsh-vim-mode


)
# clone and source init of repos
plugin-load $repos
# Souce other plugin scripts
source $ZDOTDIR/plugins/output-highlight.zsh

# Source theme file as plugin dir since
# plugin manager dont only calls specific filetype
source "${ZPLUGINDIR:=$ZDOTDIR/plugins}/powerlevel10k/powerlevel10k.zsh-theme"

LS_COLORS='rs=0:di=01;38;2;189;147;249:ln=01;38;2;139;233;253:mh=00:pi=48;2;33;34;44;38;2;241;250;140:so=01;38;2;255;121;198:do=01;38;2;255;121;198:bd=48;2;33;34;44;38;2;241;250;140;01:cd=48;2;33;34;44;38;2;241;250;140;01:or=48;2;33;34;44;38;2;255;85;85;01:mi=00:su=38;2;248;248;242;48;2;255;85;85:sg=38;2;33;34;44;48;2;241;250;140:ca=00:tw=38;2;33;34;44;48;2;80;250;123:ow=38;2;189;147;249;48;2;80;250;123:st=38;2;248;248;242;48;2;189;147;249:ex=01;38;2;80;250;123:*.7z=01;38;2;255;85;85:*.ace=01;38;2;255;85;85:*.alz=01;38;2;255;85;85:*.apk=01;38;2;255;85;85:*.arc=01;38;2;255;85;85:*.arj=01;38;2;255;85;85:*.bz=01;38;2;255;85;85:*.bz2=01;38;2;255;85;85:*.cab=01;38;2;255;85;85:*.cpio=01;38;2;255;85;85:*.crate=01;38;2;255;85;85:*.deb=01;38;2;255;85;85:*.drpm=01;38;2;255;85;85:*.dwm=01;38;2;255;85;85:*.dz=01;38;2;255;85;85:*.ear=01;38;2;255;85;85:*.egg=01;38;2;255;85;85:*.esd=01;38;2;255;85;85:*.gz=01;38;2;255;85;85:*.jar=01;38;2;255;85;85:*.lha=01;38;2;255;85;85:*.lrz=01;38;2;255;85;85:*.lz=01;38;2;255;85;85:*.lz4=01;38;2;255;85;85:*.lzh=01;38;2;255;85;85:*.lzma=01;38;2;255;85;85:*.lzo=01;38;2;255;85;85:*.pyz=01;38;2;255;85;85:*.rar=01;38;2;255;85;85:*.rpm=01;38;2;255;85;85:*.rz=01;38;2;255;85;85:*.sar=01;38;2;255;85;85:*.swm=01;38;2;255;85;85:*.t7z=01;38;2;255;85;85:*.tar=01;38;2;255;85;85:*.taz=01;38;2;255;85;85:*.tbz=01;38;2;255;85;85:*.tbz2=01;38;2;255;85;85:*.tgz=01;38;2;255;85;85:*.tlz=01;38;2;255;85;85:*.txz=01;38;2;255;85;85:*.tz=01;38;2;255;85;85:*.tzo=01;38;2;255;85;85:*.tzst=01;38;2;255;85;85:*.udeb=01;38;2;255;85;85:*.war=01;38;2;255;85;85:*.whl=01;38;2;255;85;85:*.wim=01;38;2;255;85;85:*.xz=01;38;2;255;85;85:*.z=01;38;2;255;85;85:*.zip=01;38;2;255;85;85:*.zoo=01;38;2;255;85;85:*.zst=01;38;2;255;85;85:*.avif=01;38;2;255;121;198:*.jpg=01;38;2;255;121;198:*.jpeg=01;38;2;255;121;198:*.mjpg=01;38;2;255;121;198:*.mjpeg=01;38;2;255;121;198:*.gif=01;38;2;255;121;198:*.bmp=01;38;2;255;121;198:*.pbm=01;38;2;255;121;198:*.pgm=01;38;2;255;121;198:*.ppm=01;38;2;255;121;198:*.tga=01;38;2;255;121;198:*.xbm=01;38;2;255;121;198:*.xpm=01;38;2;255;121;198:*.tif=01;38;2;255;121;198:*.tiff=01;38;2;255;121;198:*.png=01;38;2;255;121;198:*.svg=01;38;2;255;121;198:*.svgz=01;38;2;255;121;198:*.mng=01;38;2;255;121;198:*.pcx=01;38;2;255;121;198:*.mov=01;38;2;255;121;198:*.mpg=01;38;2;255;121;198:*.mpeg=01;38;2;255;121;198:*.m2v=01;38;2;255;121;198:*.mkv=01;38;2;255;121;198:*.webm=01;38;2;255;121;198:*.webp=01;38;2;255;121;198:*.ogm=01;38;2;255;121;198:*.mp4=01;38;2;255;121;198:*.m4v=01;38;2;255;121;198:*.mp4v=01;38;2;255;121;198:*.vob=01;38;2;255;121;198:*.qt=01;38;2;255;121;198:*.nuv=01;38;2;255;121;198:*.wmv=01;38;2;255;121;198:*.asf=01;38;2;255;121;198:*.rm=01;38;2;255;121;198:*.rmvb=01;38;2;255;121;198:*.flc=01;38;2;255;121;198:*.avi=01;38;2;255;121;198:*.fli=01;38;2;255;121;198:*.flv=01;38;2;255;121;198:*.gl=01;38;2;255;121;198:*.dl=01;38;2;255;121;198:*.xcf=01;38;2;255;121;198:*.xwd=01;38;2;255;121;198:*.yuv=01;38;2;255;121;198:*.cgm=01;38;2;255;121;198:*.emf=01;38;2;255;121;198:*.ogv=01;38;2;255;121;198:*.ogx=01;38;2;255;121;198:*.aac=00;38;2;139;233;253:*.au=00;38;2;139;233;253:*.flac=00;38;2;139;233;253:*.m4a=00;38;2;139;233;253:*.mid=00;38;2;139;233;253:*.midi=00;38;2;139;233;253:*.mka=00;38;2;139;233;253:*.mp3=00;38;2;139;233;253:*.mpc=00;38;2;139;233;253:*.ogg=00;38;2;139;233;253:*.ra=00;38;2;139;233;253:*.wav=00;38;2;139;233;253:*.oga=00;38;2;139;233;253:*.opus=00;38;2;139;233;253:*.spx=00;38;2;139;233;253:*.xspf=00;38;2;139;233;253:*~=00;38;2;98;114;164:*#=00;38;2;98;114;164:*.bak=00;38;2;98;114;164:*.crdownload=00;38;2;98;114;164:*.dpkg-dist=00;38;2;98;114;164:*.dpkg-new=00;38;2;98;114;164:*.dpkg-old=00;38;2;98;114;164:*.dpkg-tmp=00;38;2;98;114;164:*.old=00;38;2;98;114;164:*.orig=00;38;2;98;114;164:*.part=00;38;2;98;114;164:*.rej=00;38;2;98;114;164:*.rpmnew=00;38;2;98;114;164:*.rpmorig=00;38;2;98;114;164:*.rpmsave=00;38;2;98;114;164:*.swp=00;38;2;98;114;164:*.tmp=00;38;2;98;114;164:*.ucf-dist=00;38;2;98;114;164:*.ucf-new=00;38;2;98;114;164:*.ucf-old=00;38;2;98;114;164:';
export LS_COLORS
# CALL ALIASES
alias ls='ls --color=auto'


