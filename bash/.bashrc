#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\t ${PS1_CMD1}[\u@\h \w]\\$
