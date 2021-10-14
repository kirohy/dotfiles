#!/bin/sh

ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
cp $HOME/dotfiles/.gitconfig.local $HOME/.gitconfig.local
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
touch $HOME/.zshenv_local
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O $HOME/.git-prompt.sh

# Alacritty
mkdir -p $HOME/.config/alacritty
cp $HOME/dotfiles/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# Conky
mkdir -p $HOME/.config/conky
cp $HOME/dotfiles/conky.conf $HOME/.config/conky/conky.conf

# neovim
mkdir -p $HOME/.config
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim
cd $HOME/dotfiles/nvim
python3 -m venv venv
./venv/bin/pip install --upgrade pip
./venv/bin/pip install pynvim

# vscode
# ln -sf ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
# ln -sf ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
