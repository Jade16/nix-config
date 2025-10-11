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
          Enables  
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
    # XDG portal settings
    # brilho
    programs.light.enable = true;
    xdg.portal = {
      enable = true;
      wlr = {
        enable = true;
        settings = {
          screencast = {
            max_fps = 30;
            chooser_type = "simple";
            chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
          };
        };
      };
      config.common.default = "*";
    };

    home-manager.users.jade = {
      # Night light
      services.wlsunset = {
        enable = true;
        temperature.night = 3000;

        # Arbitrary latitude longitude pair set to São Paulo
        # (should have been based on locale but whatever)
        latitude = "-23.55";
        longitude = "-46.63";
      };    
    };
  };
}
