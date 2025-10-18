{ config, lib, pkgs, ... }:

{
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
}
