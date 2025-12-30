{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.boot.efi;
in
{
  options = {
    systems.boot.efi = {
      mount-point = mkOption {
        default = "/boot/efi";
        type = types.str;
        description = "EFI mount path";
      };
    };
  };

  config = {
    boot = {
      loader = {
        efi = {
          #efisysmountpoint = cfg.mount-point;
          cantouchefivariables = true;
        };
      };
    };     
  };
}
