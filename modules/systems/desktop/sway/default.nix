{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.gpu.nvidia;
in
{
  options = {
    systems.gpu.nvidia = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables Intel graphics  
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
