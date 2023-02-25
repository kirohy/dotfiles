export PATH="$HOME/.local/bin:$PATH"

# Rust
source $HOME/.cargo/env

# Denops
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# node
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init - zsh)"

source $HOME/.zshenv_local

