#!/bin/sh

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
cp ~/dotfiles/.gitconfig.local ~/.gitconfig.local
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vimrc.keymap ~/.vimrc.keymap
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir -p ~/.config/conky
cp ~/dotfiles/conky.conf ~/.config/conky/conky.conf
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/settings.json ~/.config/Code/User/settings.json
ln -sf ~/dotfiles/keybindings.json ~/.config/Code/User/keybindings.json
