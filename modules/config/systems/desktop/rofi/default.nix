{ lib, ... }:

{
  options = {
    systems.desktop.rofi = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enables Rofi configuration for the user.";
      };
    };
  };
}
