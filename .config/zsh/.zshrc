# Apps:
#    - azure-cli
#    - k9s
#    - lazygit
#    - tmux
#    - terraform
#    - terragrunt

# Aliasses
alias shr="source ~/.config/zsh/.zshrc"
alias tf="terraform"
alias tg="terragrunt"
alias k="kubectl"
alias d="docker"
alias kns="kubens"
alias kcx="kubectx"
alias wk="watch -n 1 kubectl"
alias v="vim"
alias lg="lazygit"
alias ssk="kitty +kitten ssh"
alias cls="clear"
alias repo="du -a ~/Repositories/* | awk '{print $2}' | fzf | xargs -r code"
alias zl="zellij"

# TMUX
alias qualityminds="tmux new -s qm -c ~/Repositories/Qualityminds"
alias zeiss="tmux new -s zeiss -c ~/Repositories/Zeiss"
alias dtm="tmux new -s dtm -c ~/Repositories/DigitalTeammates"
alias munichre="tmux new -s mre -c ~/Repositories/MunichRe"
alias personal="tmux new -s personal -c ~/Repositories/Personal"

alias tma="tmux attach-session -t"

function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
	[ -f ~/.config/zsh/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.config/zsh/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh
}

# Basic plugins
plugins+=(sudo git kubectl docker docker-compose terraform ansible ssh-agent)

# Custom plugins
plugins+=(fzf-zsh-plugin zsh-fzf-history-search fzf-tab zsh-autosuggestions zsh-vi-mode zsh-syntax-highlighting) 

zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent identities $(find ~/.ssh/certs -type f)

# VIM plugin

autoload bashcompinit && bashcompinit
autoload -U compinit && compinit
autoload -U promptinit && promptinit

source $ZSH_CUSTOM/themes/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
