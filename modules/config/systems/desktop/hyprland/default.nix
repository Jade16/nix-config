# modules/config/desktop/hyprland-nixos.nix

{ config, lib, pkgs, ... }:


{
  # Este módulo depende dos módulos de rofi, dunst e waybar,
  # então ele os importa e os ativa quando ele mesmo é ativado.
  imports = [
    #../rofi/default.nix
    #../dunst/default.nix
    ../../../../home/systems/desktop/rofi/default.nix
    ../waybar/default.nix
  ];
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --greeting 'Welcome aboard captain!' --remember";
        user = "greeter";
      };
    };
  };

  systems.desktop = {
    dunst.enable = true;
    waybar.enable = true;
    rofi.enable = true;
  };
}
