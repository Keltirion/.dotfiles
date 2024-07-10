# shell.nix

let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };

  pkgsFixed = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e89cf1c932006531f454de7d652163a9a5c86668.tar.gz") {};
in

pkgs.mkShell {

  buildInputs = with pkgsFixed; [
			# editor
  		nodejs_21 # 21.7.2
			go 				# 1.22.1
			cargo 		# 1.76.0
			neovim    # 0.9.5
			# cli
			azure-cli # 2.58.0
  ];

  packages = with pkgs; [
		# shell
		zsh
		oh-my-zsh
		starship
		# tools
		unzip
		fzf
		tmux
		kubectl
		lazygit
		kubeswitch
  ];

		# Editor
		EDITOR = "nvim";

		# XDG CONFIG
		XDG_CACHE_HOME = "$HOME/.cache";
		XDG_CONFIG_HOME = "$HOME/.config";
		XDG_DATA_HOME = "$HOME/.local/share";

		# ZSH
		ZDOTDIR = "$HOME/.config/zsh";
		ZSH = "$HOME/.config/zsh/.oh-my-zsh";
		KEEP_ZSHRC = "yes";
		HISTFILE = "$ZDOTDIR/.zsh_history";
		ZSH_CUSTOM = "$HOME/.config/zsh/.oh-my-zsh/custom";
		ZSH_COMPDUMP = "$XDG_CAHE_HOME/zsh/.zcompdump-${HOST}";

  shellHook = ''
		tmux new-session -t main
  '';
}

