#!/usr/bin/env bash

sudo apt-get -q -y install zsh

export ZDOTDIR=$HOME/.config/zsh
export ZSH=$HOME/.config/zsh/.oh-my-zsh/
export RUNZSH=no
export KEEP_ZSHRC=yes

ln -s $HOME/repositories/personal/dotfiles/.config/zsh $HOME/.config/zsh
ln -s $HOME/repositories/personal/dotfiles/.config/starship.toml $HOME/.config/starship.toml
ln -s $HOME/repositories/personal/dotfiles/.config/nvim $HOME/.config/nvim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -sS https://starship.rs/install.sh | sh
