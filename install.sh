#!/bin/sh

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env
cargo install eza bat ripgrep cargo-update stylua texlab

# Neovim
(
git clone https://github.com/neovim/neovim $HOME/neovim
cd $HOME/neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
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
./make.sh
)

# nodejs
# (
# git clone https://github.com/nodenv/nodenv.git $HOME/.nodenv
# cd $HOME/.nodenv && src/configure && make -C src
# mkdir -p $HOME/.nodenv/plugins
# git clone https://github.com/nodenv/node-build.git $HOME/.nodenv/plugins/node-build
# ./bin/nodenv init
# ./bin/nodenv install 17.9.1 # copilot
# ./bin/nodenv global 17.9.1
# )

# Link dotfiles
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
cp $HOME/dotfiles/.gitconfig.local $HOME/.gitconfig.local
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
cp $HOME/dotfiles/.ros.zsh $HOME/.ros.zsh
touch $HOME/.zshenv_local
mkdir -p $HOME/.config/bat
ln -sf $HOME/dotfiles/bat.config $HOME/.config/bat/config
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O $HOME/.git-prompt.sh

# GUI Softwares
if [ $# -eq 1 ] && [ $1 = "gui" ]; then
  # Alacritty
  (
  git clone https://github.com/alacritty/alacritty.git $HOME/alacritty
  cd $HOME/alacritty
  git checkout v0.14.0
  cargo build --release
  mkdir -p $HOME/.config/alacritty
  ln -sf $HOME/dotfiles/alacritty.toml $HOME/.config/alacritty/alacritty.toml
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

  # gnome terminal
  (
  git clone https://github.com/dracula/gnome-terminal /tmp/dracula-gnome
  cd /tmp/dracula-gnome
  ./install.sh
  )
  
  # Conky Config
  mkdir -p $HOME/.config/conky
  cp $HOME/dotfiles/conky.conf $HOME/.config/conky/conky.conf
fi

# install with sudo
cd $HOME/neovim
sudo make install

if [ $# -eq 1 ] && [ $1 = "gui" ]; then
  cd $HOME/alacritty
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
  sudo cp target/release/alacritty /usr/local/bin
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database
fi

echo "Finish building customized environment!"
