#!/bin/sh
sudo apt -y install language-pack-ja
sudo update-locale LANG=ja_JP.UTF8

sudo apt install zsh tmux curl python3-venv build-essential xclip
chsh -s /usr/bin/zsh

# Neovim
sudo apt install ninja-build gettext cmake unzip curl build-essential

# GUI Softwares
if [ $# -eq 1 ] && [ $1 = "gui" ]; then
  # Alacritty
  sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev
fi

echo "Finish install dependencies!"
