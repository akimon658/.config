#!/bin/bash

if [[ $CODESPACES == true ]]; then
  cp /workspaces/.codespaces/.persistedshare/dotfiles/ ~/.config/
fi

ln -s ~/.config/.inputrc ~/.inputrc

sudo apt update
sudo apt upgrade -y

curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb --output nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm nvim-linux64.deb

sudo curl -fsSL https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 --output /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

if [[ $(grep microsoft /proc/version) ]]; then
  echo 'eval "$(oh-my-posh init bash --config /mnt/c/Users/qiuyu/AppData/Local/Programs/oh-my-posh/themes/kushal.omp.json)"' >> ~/.bashrc

  curl -fsSL http://github.com/nullpo-head/WSL-Hello-sudo/releases/latest/download/release.tar.gz --output release.tar.gz
  tar -xf release.tar.gz
  ./release/install.sh
  rm -r release/ release.tar.gz
else
  mkdir ~/.local/share/poshthemes
  curl -fsSL https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip --output themes.zip
  unzip themes.zip -d ~/.local/share/poshthemes
  chmod u+rw ~/.local/share/poshthemes/*.omp.*
  rm themes.zip
  echo 'eval "$(oh-my-posh init bash --config ~/.local/share/poshthemes/kushal.omp.json)"' >> ~/.bashrc
fi
