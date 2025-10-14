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
    hardware.screen = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables Intel graphics  
        '';
      }
    };
  };

  config = mkIf cfg.enable {
    # Hardware settings
    #hardware = {
      # Enable OpenGL
      #opengl = {
        #graphics = {
        #enable = true;
        #driSupport = true;
        #driSupport32Bit = true;
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    services.xserver.videoDrivers = [ "modesetting" ];   
  }; 
}
