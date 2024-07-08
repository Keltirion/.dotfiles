#!/usr/bin/env bash

sudo apt-get -q -y install zsh tmux

export ZDOTDIR=$HOME/.config/zsh
export ZSH=$HOME/.config/zsh/.oh-my-zsh/
export RUNZSH=no
export CHSH=no
export KEEP_ZSHRC=yes

ln -s $HOME/repositories/personal/dotfiles/.config/zsh $HOME/.config/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s $HOME/repositories/personal/dotfiles/.config/starship.toml $HOME/.config/starship.toml
ln -s $HOME/repositories/personal/dotfiles/.config/nvim $HOME/.config/
ln -s $HOME/repositories/personal/dotfiles/.config/tmux $HOME/.config/


curl -sS https://starship.rs/install.sh | sh
