# Apps:
#    - azure-cli
#    - k9s
#    - lazygit
#    - tmux
#    - terraform
#    - terragrunt

# Basic plugins
plugins+=(sudo git kubectl docker docker-compose terraform ansible ssh-agent)

# Custom plugins
plugins+=(zsh-autosuggestions zsh-vi-mode zsh-syntax-highlighting fzf-zsh-plugin fzf-tab zsh-fzf-history-search) 

zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent identities $(find ~/.ssh/certs -type f)

autoload bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Aliasses
alias tf="terraform"
alias tg="terragrunt"
alias k="kubectl"
alias wk="watch -n 1 kubectl"
alias v="vim"
alias lg="lazygit"
alias ssk="kitty +kitten ssh"

# Functions

alias repo="du -a ~/Repositories/* | awk '{print $2}' | fzf | xargs -r code"

eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/themes/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

[ -f ~/.config/fzf/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh
