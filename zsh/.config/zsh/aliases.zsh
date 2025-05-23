alias ...='../..'
alias ....='../../..'
alias .....='../../../..'

alias d='dirs -v | head -10'
alias po=popd
alias pu=pushd

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'


# alias ls='lsd --color=auto'
alias ls='lsd'
# alias ls='ls --color=auto'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
# alias ls='ls -G'
alias lsa='ls -lah'

alias md='mkdir -p'
alias rd=rmdir

alias _=sudo

alias hist='fc -l 1'

## Reflector mirror optimization update.
alias update-mirrors="sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist"

# alias '\-'='cd -'
# alias afind='ack -il'
#
# alias please=sudo
# alias run-help=man
# alias which-command=whence

#######################
# GIT ALIASES
#######################
alias g=git

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'

alias gbl='git blame -b -w'

alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias gca='git commit -v -a'
alias 'gca!'='git commit -v -a --amend'
alias gcam='git commit -a -m'
alias 'gcan!'='git commit -v -a --no-edit --amend'
alias 'gcans!'='git commit -v -a -s --no-edit --amend'
alias gcmsg='git commit -m'
alias 'gcn!'='git commit -v --no-edit --amend'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'

alias gco='git checkout'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcm='git checkout master'

alias gcf='git config --list'

alias gcl='git clone --recursive'

alias gclean='git clean -fd'

alias gcount='git shortlog -sn'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'

alias gdct='git describe --tags `git rev-list --tags --max-count=1`'

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

alias gg='git gui citool'
alias gga='git gui citool --amend'

alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'

alias gl='git pull'
alias glum='git pull upstream master'

alias ghh='git help'

alias gignore='git update-index --assume-unchanged'

alias gignored='git ls-files -v | grep "^[[:lower:]]"'

alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'

alias gk='\gitk --all --branches'

alias gke='\gitk --all $(git log -g --pretty=%h)'


alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'

alias globurl='noglob urlglobber '

alias gm='git merge'
alias gmom='git merge origin/master'
alias gmum='git merge upstream/master'

alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'

alias gr='git remote'
alias gra='git remote add'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'

alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

alias gpristine='git reset --hard && git clean -dfx'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'

alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'


alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'

alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'

alias gsi='git submodule init'
alias gsu='git submodule update'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

alias gunignore='git update-index --no-assume-unchanged'

alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'


####################
# Aliases for kb app
####################
alias kbl='kb list'
alias kbe='kb edit'
alias kba='kb add'
alias kbv='kb view'
alias kbd='kb delete --id'
alias kbg='kb grep'
alias kbt='kb list --tags'
