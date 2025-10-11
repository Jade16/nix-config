{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.desktop.autologin;
in
{
  options = {
    systems.desktop.autologin = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables autologin 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = ''${pkgs.zsh}/bin/zsh -c "${pkgs.sway}/bin/sway"'';
          user = "jade";
        };
        default_session = initial_session;
      };
    }; 
    #services.displayManager.autoLogin = {
      #enable = true;
      #user = "locochoco";
    #};
  };
}
