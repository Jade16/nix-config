{ lib, ... }:

{
  options = {
    systems.desktop.services-user.wlsunset = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enables wlsunset service for the user.";
      };
    };
  };
}
