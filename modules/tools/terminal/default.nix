{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tools.terminal;
in
{
  options = {
    tools.terminal = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables default terminal tools 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    environment.localBinInPath = true;
    environment.systemPackages = with pkgs; [
      fastfetch
      wget
      imagemagick
      just
      timg
      w3m
      jq
      unzip
      zip
      mpv
      f3d
      bat
      xdragon
      ascii-image-converter
      ffmpeg
      zsh
      neovim
    ];

    home-manager.users.jade = {
      # System diagostics
      xdg.configFile."btop/themes/btop.theme".source = ../extra-configs/btop.theme;

      programs.btop = {
        enable = true;
        settings = {
          color_theme = "${config.xdg.configHome}/btop/themes/btop.theme";
          theme_background = false;
        };
      }; 
    };
  };
}
