{ config, pkgs, ... }:

{
  home = {
    username = "jade";
    homeDirectory = "/home/jade";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true; 

  xdg.enable = true;

  imports = [
    ../../systems/desktop/rofi/default.nix
    ../../systems/desktop/dunst/default.nix
    ../../systems/desktop/waybar/default.nix 
    ../../systems/desktop/services-user/cliphist/default.nix
    ../../systems/desktop/services-user/wlsunset/default.nix
    ../../systems/security/gpg.nix
    ../../systems/services/packages/default.nix
    ../../tools/development/git.nix
    ../../tools/terminal/default.nix
    ../../tools/terminal/kitty/default.nix
    ../../tools/terminal/zsh/zsh.nix
  ];
}
