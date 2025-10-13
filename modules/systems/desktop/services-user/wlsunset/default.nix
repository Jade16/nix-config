{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.desktop.services-user.wlsunset;
in
{
  options = {
    systems.desktop.services-user.wlsunset = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables wlsunset 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users.jade = {
      services.wlsunset = {             # Redução de luz azul (noite)
        enable = true;
        temperature.night = 3000;       # Temperatura de cor noturna
        latitude = "-23.55";            # Coordenadas de São Paulo
        longitude = "-46.63";
      };
    };
  };
}
