{ lib, ... }:
with lib;
{
  options = {
    systems.desktop.services-user.dunst = {
      enable = mkEnableOption "Enables dunst notification daemon for the user.";
    };
  };
}
