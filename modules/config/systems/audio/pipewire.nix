{
  config,
  lib,
  pkgs,
  ...
}:

  with lib;
  let
    cfg = config.systems.audio.pipewire;
  in
  {
    options = {
      systems.audio.pipewire = {
        enable = mkEnableOption "Audio module"; 
      };
    };

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
