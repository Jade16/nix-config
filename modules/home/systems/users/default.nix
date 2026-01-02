{ config, pkgs, ... }:
# arquivo principal do Home Manager 
{
  home = {
    username = "jade";
    homeDirectory = "/home/jade";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true; 

  xdg.enable = true;

  #xdg.configFile."hyprland.conf" = {
    #source = inputs.self + "./modules/home/hyprland.conf";
    #force = true;
  #};

  imports = [
    ../../systems/desktop/rofi/default.nix
    ../../systems/desktop/dunst/default.nix
    ../../systems/desktop/waybar/default.nix
    ../../systems/desktop/hyprland/default.nix
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
