{ config, lib, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;       
    efi.canTouchEfiVariables = true; 
    #systemd-boot.efiInstallAsRemovable = false;
    #systemd-boot.canTouchEfiVariables = true;
    #efi.efiSysMountPoint = "/boot/efi";  # partição EFI montada
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/E7C5-5C30";  # substitua pelo UUID correto
    fsType = "vfat";
  };

  boot.kernelParams = [
    "pci=nommconf"
    "pcie_aspm=off"
    "nvme_core.default_ps_max_latency_us=0"
  ];
}

