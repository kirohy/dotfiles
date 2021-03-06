#!/bin/sh

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
cp ~/dotfiles/.gitconfig.local ~/.gitconfig.local
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Alacritty
mkdir -p ~/.config/alacritty
cp ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

# Conky
mkdir -p ~/.config/conky
cp ~/dotfiles/conky.conf ~/.config/conky/conky.conf

# neovim
ln -sf ~/dotfiles/nvim ~/.config/nvim
cd nvim
python3 -m venv venv
source ./venv/bin/activate
pip install pynvim
deactivate

# vscode
ln -sf ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
