{ config, lib, pkgs, ... }:

lib.mkIf config.tools.terminal.kitty.enable {

  programs.kitty = {
    enable = true;
    # CORREÇÃO: 'themeFile' trocado por 'theme'
    theme = "Catppuccin-Mocha";
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

}
