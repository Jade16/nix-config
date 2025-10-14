# modules/config/desktop/hyprland-nixos.nix

{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.systems.desktop.hyprland;
in
{
  # Este módulo depende dos módulos de rofi, dunst e waybar,
  # então ele os importa e os ativa quando ele mesmo é ativado.
  imports = [
    ../rofi/default.nix
    ../dunst/default.nix
    ../waybar/default.nix
  ];

  options = {
    systems.desktop.hyprland = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = "Enables the Hyprland desktop environment.";
      };
    };
  };

  config = mkIf cfg.enable {
    # Habilita o Hyprland no sistema para que ele apareça como uma sessão
    programs.hyprland.enable = true;

    # Prepara variáveis de ambiente para Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # Configura o gerenciador de login (greetd) para usar Hyprland
    # Lembre-se que esta configuração conflita com o seu módulo de autologin!
    # Ative apenas um deles por vez.
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --greeting 'Welcome aboard captain!' --remember";
          user = "greeter";
        };
      };
    };

    # Ativa os módulos de dependência (rofi, dunst, waybar)
    systems.desktop = {
      dunst.enable = true;
      waybar.enable = true;
      rofi.enable = true;
    };
  };
}
