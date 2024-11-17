# darwin.nix

{ pkgs, ... }:

{
	environment.systemPackages = [
		pkgs.ripgrep
			pkgs.fzf
			pkgs.gh
	];

	fonts.packages = [
		pkgs.nerdfonts
	];

	services.nix-daemon.enable = true;
#services.karabiner-elements.enable = true;

	nix = {
		package = pkgs.nix;
		settings.experimental-features = [ "nix-command flakes" ];
	};

	system.stateVersion = 5;

	nixpkgs.hostPlatform = "aarch64-darwin";

	users.users.dylan = {
		name = "dylan";
		home = "/Users/dylan";
	};
	programs.bash.enable = false;

	environment.variables = {
		EDITOR = "vim";
	};
}
