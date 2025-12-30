{ config, pkgs, ... }:
# configuracao do Rofi (launcher de aplicações, seletor de janelas e utilitário de linha de comando)
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

