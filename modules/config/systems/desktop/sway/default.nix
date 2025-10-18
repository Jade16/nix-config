{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.desktop.sway;
in
{
  options = {
    systems.desktop.sway = {
      enable = mkEnableOption "Enables the Sway desktop environment.";
    };
  };

  config = mkIf cfg.enable {
    # ADICIONADO: Ativa o próprio Sway
    programs.sway.enable = true;

    # Security (suas configurações já estavam corretas)
    security.polkit.enable = true;
    security.pam.services.swaylock = {};
  };
}
