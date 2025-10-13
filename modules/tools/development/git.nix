{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tools.development.git;
in
{
  options = {
    tools.development.git = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables git 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users.jade = {
      programs.git = {
        enable = true;
        extraConfig = {
          user = {
            name = "Jade";
            email = "jade_bortot_paiva@usp.br";
          };
          init = {defaultBranch = "main";};
        };
      };
    };
  };
}
