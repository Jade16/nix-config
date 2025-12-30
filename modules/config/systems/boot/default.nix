{ config, lib, pkgs, ... }:
# configuracao de boot/EFI 
{
  boot.loader = {
    systemd-boot.enable = true; 
    efi.canTouchEfiVariables = true; #necessario para dual-boot
    #systemd-boot.efiInstallAsRemovable = false;
    #systemd-boot.canTouchEfiVariables = true;
    #efi.efiSysMountPoint = "/boot/efi";  # partição EFI montada
  };

  fileSystems."/boot/efi" = { #onde a particicao eh montada 
    device = "/dev/disk/by-uuid/E7C5-5C30";  # identificador
    fsType = "vfat"; # sistemas de arquivos padrao para particoes EFI 
  };

  boot.kernelParams = [
    "pci=nommconf"
    "pcie_aspm=off"
    "nvme_core.default_ps_max_latency_us=0"
  ];
}

