{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tools.terminal.kitty;
in
{
  options = {
    tools.terminal.kitty = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables kitty 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users.jade = {
      programs.kitty = {
        enable = true;
        #theme = "Catppuccin-Mocha";
        themeFile = "Catppuccin-Mocha"; 
        font = {
          name = "GoMono Nerd Font Mono";
          size = 18;
        };
        settings = {
          shell = "tmux attach";
          enable_audio_bell = false;
          background_opacity = "0.95";
          cursor_shape = "block";
        };
      };
    };
  };
}
