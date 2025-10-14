{ lib, ... }:

{
  options = {
    systems.desktop.waybar = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enables Waybar status bar for the user.";
      };
    };
  };
}
