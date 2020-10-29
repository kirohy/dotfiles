# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kirohy/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kirohy/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kirohy/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kirohy/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# <<< conda initialize <<<

# Rust
source $HOME/.cargo/env

# Julia
export PATH="$HOME/julia/bin:$PATH"
