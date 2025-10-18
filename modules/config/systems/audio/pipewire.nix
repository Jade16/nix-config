{
  config,
  lib,
  pkgs,
  ...
}:

  {

    config = mkIf cfg.enable {
      services = {
        pipewire = {
          enable = true;
          alsa = {
            enable = true;
            support32Bit = true;
          };
          pulse = {
            enable = true;
          };
        };
      };
      security.rtkit.enable = true; 
    };
  }
