### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light 'zsh-users/zsh-history-substring-search'
zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'zsh-users/zsh-completions'
zinit light 'zsh-users/zsh-syntax-highlighting'
### End of Zinit's installer chunk

# prompt with git
setopt PROMPT_SUBST
source $HOME/.git-prompt.sh
fpath=($HOME/.zsh $fpath)

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true

PS1='%f%F{magenta}[$(date +"%H:%M:%S")] %f%F{green}%~%f%F{cyan}$(__git_ps1)%f
%% '

# history
HISTFILE=$HOME/.zsh_hist
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# vi
bindkey -v

# completion
zstyle ':completion:*' matcher-list m:{a-z}={A-Z}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-lolors "${LS_COLORS}"

# other options
setopt auto_cd
setopt auto_list
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups
setopt no_flow_control

alias ls='exa --icons'
alias la='exa -ahl --git --icons'
alias bat='bat --theme="Dracula"'
alias vim='nvim'
alias g='git'
alias ..='cd ..'
alias ...='cd ../..'
alias tnew='tmux new -s'
alias tat='tmux a -t'
alias tls='tmux ls'
alias tks='tmux kill-session -t'
alias tkw='tmux kill-window -t'
alias tkp='tmux kill-pane -t'
alias shutdown='sudo shutdown -h now'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias luamake=$HOME/.lua-language-server/3rd/luamake/luamake

chpwd() { ls }

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
# bindkey 'jj' vi-cmd-mode

if [[ -e $HOME/.ros.zsh ]]; then source $HOME/.ros.zsh; fi
if [[ -e $HOME/.Xmodmap ]]; then xmodmap $HOME/.Xmodmap; fi

if [[ -z "$TMUX" && $TERM_PROGRAM != "vscode" && $TERMINAL_EMULATOR != "JetBrains-JediTerm" ]]; then
    SSH_SESSION=`tmux ls | grep ssh`
    if [[ -n "$SSH_CONNECTION" ]]; then
        if [[ -z "$SSH_SESSION" ]]; then
            tmux new -s ssh
        else
            tmux a -t ssh
        fi
    else
        tmux
    fi
fi
