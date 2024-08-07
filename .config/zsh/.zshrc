# Aliasses
alias shr="source ~/.config/zsh/.zshrc"
alias tf="terraform"
alias tg="terragrunt"
alias k="kubectl"
alias ks="switch"
alias ksn="switch ns"
alias d="docker"
alias kns="kubens"
alias kcx="kubectx"
alias wk="watch -n 1 kubectl"
alias v="vim"
alias nv="nvim"
alias lg="lazygit"
alias repo="du -a ~/Repositories/* | awk '{print $2}' | fzf | xargs -r code"
alias zl="zellij"

alias git-show-untracked='git fetch -p ; git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}"'
alias git-remove-untracked='git fetch -p ; git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -D'

# TMUX
alias qualityminds="tmux new -s qm -c ~/Repositories/Qualityminds"
alias zeiss="tmux new -s zeiss -c ~/Repositories/Zeiss"
alias dtm="tmux new -s dtm -c ~/Repositories/DigitalTeammates"
alias personal="tmux new -s personal -c ~/Repositories/Personal"

alias tma="tmux attach-session -t"

# Basic plugins
plugins+=(sudo git kubectl docker docker-compose terraform ansible azure ssh-agent)

# Custom plugins
# Set author as key and repo as value
declare -A custom_plugins

custom_plugins[unixorn]="fzf-zsh-plugin"
custom_plugins[Aloxaf]="fzf-tab"
custom_plugins[jeffreytse]="zsh-vi-mode"
custom_plugins[zsh-users]="zsh-autosuggestions"

# Install custom plugins
for author plugin in "${(@kv)custom_plugins}"; do
	if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
		echo "Installing missing plugin -- $plugin"
		echo "------------------------------------"
		git clone --depth 1 https://github.com/$author/$plugin.git $ZSH_CUSTOM/plugins/$plugin &&
	fi
	if [[ $plugin != "zsh-syntax-highlighting" ]]; then
		plugins+=$plugin
	fi
done

# FZF load order
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
	[ -f ~/.config/zsh/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.config/zsh/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh
}

zstyle :omz:plugins:ssh-agent quiet yes
if [ -d ~/.ssh/certs ]; then
	zstyle :omz:plugins:ssh-agent identities $(find ~/.ssh/certs -type f)
fi

autoload bashcompinit && bashcompinit
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# kubeswitch
source <(switcher init zsh)
source <(alias s=switch)
source <(compdef _switcher switch)

# Theme
if [ ! -d $ZSH_CUSTOM/themes/catppuccin ]; then
	git clone --depth 1 https://github.com/catppuccin/zsh-syntax-highlighting.git $ZSH_CUSTOM/themes/catppuccin
fi

if [ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
	git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

source $ZSH_CUSTOM/themes/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
