{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.boot.grub;
in
{
  options = {
    systems.boot.grub = {
      enable = mkEnableOption "Grub module";
    };
  };

  config = mkIf cfg.enable {
    boot.loader = {
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        efiInstallAsRemovable = true;
        fsIdentifier = "uuid";
        extraEntries = ''
        menuentry "Reboot"{ reboot }
        menuentry "Poweroff"{ halt }
        ''; 
      };
    };
  };       
}
