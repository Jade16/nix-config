{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tools.terminal.nvim;
in
{
  options = {
    tools.terminal.nvim = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables nvim editor 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    environment.variables.EDITOR = "nvim";
  };
}
