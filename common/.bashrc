# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load core dotfiles
for file in ~/.bash_{alias,path}; do
    [ -r "$file" ] && source "$file"
done

# Load extra dotfiles
# Filenames should follow convention: .bash_extra_{something}
for file in ~/.bash_extra_*; do
    [ -r "$file" ] && source "$file"
done

unset file

# Don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000

# Git completion/prompt
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
#source /usr/local/etc/bash_completion.d/git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWSTASHSTATE=1
export PS1='\u@\h:\w$(__git_ps1 " (%s)")$ '
