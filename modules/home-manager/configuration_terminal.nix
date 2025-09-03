{
  config,
  lib,
  pkgs,
  ...
}: {  

  # Terminal
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
}
