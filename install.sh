#!/bin/sh
sudo apt install zsh tmux vim conky-all curl python3-venv build-essential
chsh -s /usr/bin/zsh

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I

# vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt install vivaldi-stable

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env
cargo install exa bat

# Alacritty
(
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
git clone https://github.com/alacritty/alacritty.git $HOME/alacritty
cd $HOME/alacritty
git checkout v0.9.0
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
)

# Neovim
(
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
git clone https://github.com/neovim/neovim $HOME/neovim
cd $HOME/neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release -j4
sudo make install
)

# Lua Language server
(
git clone https://github.com/sumneko/lua-language-server $HOME/.lua-language-server
cd $HOME/.lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
)

# Denops
curl -fsSL https://deno.land/x/install/install.sh | sh

# Ubuntu gnome
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down', '<Control><Alt>Down', '<Control><Alt>j']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up', '<Control><Alt>Up', '<Control><Alt>k']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left', '<Control><Alt>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Left', '<Control><Alt>l']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>Page_Down', '<Control><Shift><Alt>Down', '<Control><Shift><Alt>j']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>Page_Up', '<Control><Shift><Alt>Up', '<Control><Shift><Alt>k']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Shift><Alt>Left', '<Control><Shift><Alt>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Shift><Alt>Right', '<Control><Shift><Alt>l']"

# font
FONT_ADDRESS=$(curl -v https://api.github.com/repos/yuru7/HackGen/releases/latest | jq -r '.assets[0].url')
curl -L -H 'Accept: application/octet-stream' "$FONT_ADDRESS" -o HackGenNerd.zip
unzip HackGenNerd.zip
cp ./HackGenNerd*/HackGenNerdConsole-Regular.ttf $HOME/.local/share/fonts/
