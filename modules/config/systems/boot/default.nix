{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = false;
      }; 
    }; 

    kernelParams = [
      "pci=nommconf"
      "pcie_aspm=off"   
      "nvme_core.default_ps_max_latency_us=0"   
    ];
  };     
}
