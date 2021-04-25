# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# Rust
source $HOME/.cargo/env

# Julia
# export PATH="$HOME/julia/bin:$PATH"

# coc-clangd
export PATH="$HOME/.config/coc/extensions/coc-clangd-data/install/12.0.0/clangd_12.0.0/bin:$PATH"
