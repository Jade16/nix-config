{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.hardware.screen;
in
{
  options = {
    systems.hardware.screen = {
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
    # Hardware settings
    hardware = {
      # Enable OpenGL
      #opengl = {
        graphics = {
        enable = true;
        #driSupport = true;
        #driSupport32Bit = true;
      };
    }; 
  };
}
