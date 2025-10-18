{ lib, ... }:
with lib;
{
  options = {
    systems.desktop.waybar = {
      enable = mkEnableOption "Enables Waybar status bar for the user.";
    };
  };
}
