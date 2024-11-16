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
		eza
		starship
		tmux
		yazi
	];

	programs.eza = {
		enable = true;
	};

	programs.starship = {
		enable = true;
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
			show_hidden = true;
			sort_dir_first = true;
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
			ls = "l";
			dupdate = "darwin-rebuild switch --flake $HOME/.config/nix";
			t = "tmux";
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
	};


	programs.home-manager.enable = true;
}
