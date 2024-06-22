#!/bin/bash
# For GitHub Codespaces

cp -aT /workspaces/.codespaces/.persistedshare/dotfiles/ ~/.config/

sudo apt-get update
sudo apt-get upgrade -y

curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim.appimage --output nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

curl -sS https://starship.rs/install.sh | sh -s -- -y
cat << 'EOS' >> ~/.bashrc
eval "$(starship init bash)"
EOS
