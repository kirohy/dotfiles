# zplug -----------------------------------------------
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug check || zplug install
zplug load

#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

#zplug load --verbose

# color
autoload -Uz colors
colors

# prompt with git
setopt PROMPT_SUBST
source ~/.git-prompt.sh
fpath=(~/.zsh $fpath)

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

export EDITOR=vim
export LANG=ja_JP.UTF-8

PS1='%F{red}%n: %f%F{green}%~%f%F{cyan}$(__git_ps1)%f
%% '

# history
HISTFILE=~/.zsh_hist
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# vi
bindkey -v

# completion
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list m:{a-z}={A-Z}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-lolors "${LS_COLORS}"

# other options
setopt auto_cd
setopt auto_list
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups

alias ls='ls --color'
alias la='ls -la --color'
#alias vim='nvim'
alias g='git'
alias ..='cd ..'
alias ...='cd ../..'
alias tnew='tmux new -s'
alias tat='tmux a -t'
alias tls='tmux ls'
alias tks='tmux kill-session -t'
alias notify='mpg321 -q ~/Music/success.mp3 || mpg321 -q ~/Music/fail.mp3'
alias shutdown='sudo shutdown -h now'

chpwd() { ls }

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
