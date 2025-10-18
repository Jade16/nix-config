{ lib, ... }:

with lib;

{
  options = {
    systems.desktop.services-user.cliphist = {
      enable = mkEnableOption "Enables cliphist service for the user.";

    };
  };
}
