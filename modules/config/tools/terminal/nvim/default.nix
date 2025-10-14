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
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enables Neovim configuration and sets it as the default editor.";
      };
    };
  };

  #config = mkIf cfg.enable {
    #environment.variables.EDITOR = "nvim";
  #};
}
