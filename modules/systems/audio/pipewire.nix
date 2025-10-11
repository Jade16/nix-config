{
  config,
  lib,
  pkgs,
  ...
}:

  with lib;
  let
    ctg = config.systems.audio.pipewire;
  in
  {
    options = {
      systems.audio.pipewire = {
        enable = mkOption {
          default = false;
          type = types.bool;
          description = ''
            Enable Pipewire
          '';
        };
      };
    };

    config = mkIf cfg.enable {
      services = {
        pulseaudio = {
          enable = false;
        };
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
