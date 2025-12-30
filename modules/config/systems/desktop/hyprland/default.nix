{ config, lib, pkgs, ... }:
# arquivo principal de configuracao do Hyprland e seu ambiente
{
  imports = [
    #../../../../home/systems/desktop/waybar/default.nix
    #../../../../home/systems/desktop/dunst/default.nix
    #../../../../home/systems/desktop/rofi/default.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  }; 

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # inicia Hyprland com o seu usuário
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --greeting 'Welcome aboard, Captain Jade!' --remember";
        user = "jade";
      };
    };
  };

  # exemplo de ativação de outros módulos do desktop
  #systems.desktop = {
    #dunst.enable = true;
    #waybar.enable = true;
    #rofi.enable = true;
  #};
}

