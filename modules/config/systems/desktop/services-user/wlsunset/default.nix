{ lib, ... }:
with lib;
{
  options = {
    systems.desktop.services-user.wlsunset = {
      enable = mkEnableOption "Enables wlsunset service for the user.";
    };
  };
}
