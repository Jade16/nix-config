{ lib, ... }:

{
  options = {
    systems.desktop.services-user.dunst = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enables dunst notification daemon for the user.";
      };
    };
  };
}
