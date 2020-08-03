#!/bin/sh

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc.keymap ~/.vimrc.keymap
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/settings.json ~/.config/Code/User/settings.json
ln -sf ~/dotfiles/keybindings.json ~/.config/Code/User/keybindings.json
ln -sf ~/dotfiles/conky.conf ~/.config/conky/conky.conf

cp ~/dotfiles/.gitconfig.local ~/.gitconfig.local
