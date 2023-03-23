#!/bin/bash

if [[ $CODESPACES == true ]]; then
  cp /workspaces/.codespaces/.persistedshare/dotfiles/ ~/.config/
fi

ln -s ~/.config/.inputrc ~/.inputrc

cat << 'EOS' >> ~/.bashrc
export XDG_DATA_HOME=$HOME/.local/share

export DENO_INSTALL_ROOT=$XDG_DATA_HOME/deno
export GOPATH=$XDG_DATA_HOME/go

export PATH=$DENO_INSTALL_ROOT/bin:$GOPATH/bin:$PATH
EOS

sudo sed -r 's@http://(jp\.)?archive\.ubuntu\.com/ubuntu/?@https://linux.yz.yamagata-u.ac.jp/ubuntu/@g' /etc/apt/sources.list
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt update
sudo apt upgrade -y

# https://github.com/denoland/deno_install#unzip-is-required
sudo apt install unzip -y
curl -fsSL https://deno.land/x/install/install.sh | sh

sudo apt install golang-go -y

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
