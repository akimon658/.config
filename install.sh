#!/bin/bash
# For GitHub Codespaces

cp -aT /workspaces/.codespaces/.persistedshare/dotfiles/ ~/.config/

sudo apt-get update
sudo apt-get upgrade -y

curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz | tar xz
sudo cp -r nvim-linux64/* /usr/local/
rm -rf nvim-linux64

curl -sS https://starship.rs/install.sh | sh -s -- -y
cat << 'EOS' >> ~/.bashrc
eval "$(starship init bash)"
EOS
