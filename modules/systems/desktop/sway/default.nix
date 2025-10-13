{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.desktop.sway;
in
{
  options = {
    systems.desktop.sway = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables Sway  
        '';
      };
      open = mkOption {
        default = true;
        type = types.bool;
        description = ''
           
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    # Security
    security.polkit.enable = true;
    security.pam.services.swaylock = {};
  };
}
