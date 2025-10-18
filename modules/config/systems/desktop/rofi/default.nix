{ lib, ... }:

with lib;

{
  options = {
    systems.desktop.rofi = {
      enable = mkEnableOption "Enables Rofi configuration for the user.";
    };
  };
}
