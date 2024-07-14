# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
	environment.systemPackages = with pkgs; [
		brave
		kitty
		sublime
		capitaine-cursors-themed
		gnome.gnome-tweaks
		git
		gnumake
		gnat
		stremio
		valgrind
		neovim
		gdb
		libsForQt5.kdenlive
		gimp-with-plugins
		sioyek
	];
}
