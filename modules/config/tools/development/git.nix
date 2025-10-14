{ lib, ... }:

{
  options = {
    tools.development.git = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enables Git configuration for the user.";
      };
    };
  };
}
