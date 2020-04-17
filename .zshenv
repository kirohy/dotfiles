# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Julia
# export PATH="$HOME/julia-1.3.1/bin:$PATH"
