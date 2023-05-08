#!/bin/sh
sudo apt install zsh tmux curl python3-venv build-essential xclip
chsh -s /usr/bin/zsh

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env
cargo install exa bat ripgrep

# Neovim
(
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
git clone https://github.com/neovim/neovim $HOME/neovim
cd $HOME/neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release -j4
sudo make install
mkdir -p $HOME/.config
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim
cd $HOME/dotfiles/nvim
python3 -m venv venv
./venv/bin/pip install --upgrade pip
./venv/bin/pip install pynvim rospkg
)

# Lua Language server
(
git clone https://github.com/LuaLS/lua-language-server.git $HOME/.lua-language-server
cd $HOME/.lua-language-server
git co v3.6.11 # 18.04
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
)

# nodejs
(
git clone https://github.com/nodenv/nodenv.git $HOME/.nodenv
cd $HOME/.nodenv && src/configure && make -C src
mkdir -p $HOME/.nodenv/plugins
git clone https://github.com/nodenv/node-build.git $HOME/.nodenv/plugins/node-build
./bin/nodenv init
./bin/nodenv install 17.9.1 # copilot
./bin/nodenv install 18.14.2 # LTS
./bin/nodenv global 18.14.2
)

# Link dotfiles
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
cp $HOME/dotfiles/.gitconfig.local $HOME/.gitconfig.local
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
touch $HOME/.zshenv_local
mkdir -p $HOME/.config/bat
ln -sf $HOME/dotfiles/bat.config $HOME/.config/bat/conf
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O $HOME/.git-prompt.sh

# GUI Softwares
if [ $# -eq 1 ] && [ $1 = "gui" ]; then
  # vivaldi
  wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
  sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
  sudo apt update && sudo apt install vivaldi-stable

  # Alacritty
  (
  sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
  git clone https://github.com/alacritty/alacritty.git $HOME/alacritty
  cd $HOME/alacritty
  git checkout v0.11.0
  cargo build --release
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
  sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database
  mkdir -p $HOME/.config/alacritty
  cp $HOME/dotfiles/alacritty.yml $HOME/.config/alacritty/alacritty.yml
  )

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
  (
  cd $HOME/Downloads
  FONT_ADDRESS=$(curl -v https://api.github.com/repos/yuru7/HackGen/releases/latest | jq -r '.assets[0].url')
  curl -L -H 'Accept: application/octet-stream' "$FONT_ADDRESS" -o HackGenNerd.zip
  unzip HackGenNerd.zip
  cp ./HackGenNerd*/HackGenNerdConsole-Regular.ttf $HOME/.local/share/fonts/
  )
  
  # Conky Config
  mkdir -p $HOME/.config/conky
  cp $HOME/dotfiles/conky.conf $HOME/.config/conky/conky.conf
fi

echo "Finish building customized environment!"
