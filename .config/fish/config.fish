if status is-interactive
and not set -q TMUX
    # Commands to run in interactive sessions can go here
    tmux new-session -A -s main
end

alias vim="nvim"
alias v="nvim"

alias lg="lazygit"


fish_add_path -a /usr/local/go/bin
fish_add_path -a $HOME/go/bin/
