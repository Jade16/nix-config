{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tools.terminal.zsh.zsh;
in
{
  options = {
    tools.terminal.zsh.zsh = {
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
