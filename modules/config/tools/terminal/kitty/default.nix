{ lib, ... }:

{
  options = {
    tools.terminal.kitty = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enables kitty terminal configuration.";
      };
    };
  };
}
