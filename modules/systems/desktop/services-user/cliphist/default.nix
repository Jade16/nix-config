{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.desktop.services-user.cliphist;
in
{
  options = {
    systems.desktop.services-user.cliphist = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables cliphist 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users.jade = {
      services.cliphist.enable = true;  # Histórico da área de transferência
    };
  };
}
