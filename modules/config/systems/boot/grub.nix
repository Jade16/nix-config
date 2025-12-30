{ config, lib, pkgs, ... }:

{
  boot.loader.grub = {
    enable = true;
    efiSupport = true;               # ativa UEFI
    efiInstallAsRemovable = false;   # opcional, geralmente false
    useOSProber = true;              # detecta outros sistemas (Windows)
    version = 2;
    # REMOVA devices = ["nodev"] → deixa NixOS detectar EFI automaticamente
    extraEntries = ''
      menuentry "Reboot"{ reboot }
      menuentry "Poweroff"{ halt }
    '';
    efiSysMountPoint = "/boot/efi";
    canTouchEfiVariables = true; 
  };
}

