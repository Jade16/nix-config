{
  config,
  lib,
  pkgs,
  ...
}:
{

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
