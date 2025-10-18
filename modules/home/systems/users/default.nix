{ config, pkgs, ... }:

{
  home = {
    username = "jade";
    homeDirectory = "/home/jade";
    stateVersion = "25.05";
  };

  xdg.enable = true;

  imports = [
    #../../desktop/hyprland/default.nix
    #../../desktop/rofi/default.nix
    ../../systems/desktop/services-user/cliphist/default.nix
    ../../systems/desktop/services-user/dunst/default.nix
    ../../systems/desktop/services-user/wlsunset/default.nix
    ../../systems/desktop/waybar/default.nix
    ../../systems/security/gpg.nix
    ../../systems/services/packages/default.nix
    ../../systems/services/packages/browser/zenbrowser.nix
    ../../tools/development/git.nix
    ../../tools/terminal/default.nix
    ../../tools/terminal/kitty/default.nix
    ../../tools/terminal/nvim/default.nix
    ../../tools/terminal/zsh/zsh.nix
  ];
}
