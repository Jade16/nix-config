{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tools.terminal.zsh;
in
{
  options = {
    tools.terminal.zsh = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables zsh 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
  };
}
