# Path
export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.local/bin/go/bin:/opt/homebrew/opt/postgresql@16/bin"

# Editor
export EDITOR=nvim

# XDG CONFIG
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# ZSH
export ZDOTDIR=$HOME/.config/zsh
export ZSH=$HOME/.config/zsh/.oh-my-zsh
export KEEP_ZSHRC=yes
export HISTFILE=$ZDOTDIR/.zsh_history
export ZSH_CUSTOM=$HOME/.config/zsh/.oh-my-zsh/custom
export ZSH_COMPDUMP=$XDG_CAHE_HOME/zsh/.zcompdump-${HOST}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#d787ff,bold'

# zsh vi plugin
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# zsh tmux plugin
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false

# Golang
export GOPATH="$HOME/.golib"
export GOPATH="$GOPATH:$HOME/Repositories/Personal/Golang/:$HOME/Repositories/Zeiss/Golang/"

# Zellij
export ZELLIJ_CONFIG_DIR="$HOME/.config/zellij/"
