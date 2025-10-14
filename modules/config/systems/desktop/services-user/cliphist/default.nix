{ lib, ... }:

{
  options = {
    systems.desktop.services-user.cliphist = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enables cliphist service for the user.";
      };
    };
  };
}
