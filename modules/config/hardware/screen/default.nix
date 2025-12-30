{  config, lib, pkgs, ... }:
# configuracao de graficos/OpenGL 
{
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "modesetting" ];   
}
