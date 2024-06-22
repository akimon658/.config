#!/bin/bash
# For GitHub Codespaces

cp -aT /workspaces/.codespaces/.persistedshare/dotfiles/ ~/.config/

sudo apt update
sudo apt upgrade -y

curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb --output nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm nvim-linux64.deb

curl -sS https://starship.rs/install.sh | sh
cat << 'EOS' >> ~/.bashrc
eval "$(starship init bash)"
EOS
