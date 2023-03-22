#!/bin/bash

rm ~/.bashrc
ln -s ~/.config/.bashrc ~/.bashrc

rm ~/.inputrc
ln -s ~/.config/.inputrc ~/.inputrc

curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
