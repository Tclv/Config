#!/usr/bin/env bash
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/Config/nvimrc ~/.config/nvim/init.vim
ln -s ~/Config/ghci ~/.ghci
nvim +PlugInstall +qall
