# home.nix

{ config, pkgs, ... }:

{
	home.stateVersion = "24.11";

	home = {
		username = "dylan";
		homeDirectory = "/Users/dylan";
	};

	catppuccin = {
		enable = true;
		flavor = "mocha";
		accent = "sapphire";
	};

	home.packages = with pkgs; [
		btop
		eza
		starship
		tmux
		tree
		yazi
	];

	programs.eza = {
		enable = true;
	};

	programs.starship = {
		enable = true;
		settings = {
			command_timeout = 10000;
		};
	};

	programs.tmux = {
		enable = true;
		sensibleOnTop = false;
		shell = "\$SHELL";
		plugins = with pkgs; [
		];
	};

	programs.yazi = {
		enable = true;
		enableZshIntegration = true;
		settings = {
			manager = {
				show_hidden = true;
				sort_dir_first = true;
			};
		};
		shellWrapperName = "y";
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			g = "git";
			l = "eza -lah --sort=name --color=always --icons --group-directories-first";
			dupdate = "darwin-rebuild switch --flake $HOME/.config/nix-config";
			t = "tmux";
			vim = "nvim";
			v = "nvim";
			proj = "cd $HOME/Documents/Projects";
			nc = "$EDITOR $HOME/.config/nix-config";
			nd = "nix develop -c $SHELL";
		};
		plugins = [
			{
				name = "zsh-autopair";
				src = pkgs.zsh-autopair;
			}
			{
				name = "zsh-vi-mode";
				src = pkgs.zsh-vi-mode;
			}
		];
		completionInit = ''
		autoload -U compinit && compinit
		zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
		'';
		profileExtra = ''
			eval "$(/opt/homebrew/bin/brew shellenv)"	
			export PATH="'$(brew --prefix)'/opt/python/libexec/bin:$PATH"
		'';
	};


	programs.home-manager.enable = true;
}
