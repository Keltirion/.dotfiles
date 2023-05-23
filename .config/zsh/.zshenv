# Path
export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.local/bin/go/bin"

# Editor
export EDITOR=nvim

#XDG CONFIG
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# zsh
export ZDOTDIR=$HOME/.config/zsh \
export ZSH=$HOME/.config/zsh/.oh-my-zsh
export KEEP_ZSHRC=yes
export HISTFILE=$ZDOTDIR/.zsh_history
export ZSH_CUSTOM=$HOME/.config/zsh/.oh-my-zsh/custom
export ZSH_COMPDUMP=$HOME/.cache/zsh/.zcompdump-${HOST}

# zsh vi plugin
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# zsh tmux plugin
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false

# Golang
export GOPATH="$HOME/.golib"
export GOPATH="$GOPATH:$HOME/Repositories/Personal/Golang/"

