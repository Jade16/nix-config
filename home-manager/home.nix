# Home manager settings
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  # Imports
  imports = [
    #../modules/home-manager
  ];

  home = {
    username = "jade";
    homeDirectory = "/home/jade";
  }

  # Packages
  home.packages = with pkgs; [
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
    libsForQt5.okular
    krita
    vscode
    neovim
    logisim
    inkscape-with-extensions
    gimp-with-plugins
    gdb
    libsForQt5.kdenlive
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  # O QUE EH ISSO????

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
  # MUDAR PARA 24.05???
}