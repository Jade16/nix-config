# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  # my-module = import ./my-module.nix;
  imports = [
	./configuration_git.nix
	#./configuration_neovim.nix
	./configuration_shell.nix
	./configuration_statusbar.nix
	./configuration_terminal.nix
	./configuration_wm.nix
  ];
}
