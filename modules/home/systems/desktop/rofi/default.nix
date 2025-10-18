{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "catppuccin-mocha";
    extraConfig = {
      modi = "drun,run";
      show-icons = true;
      font = "JetBrainsMono Nerd Font 11";
      icon-theme = "Papirus-Dark";
    };
  };
}

