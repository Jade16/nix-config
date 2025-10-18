{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.boot;
in
{
  options = {
    systems.boot = {
      enable = mkEnableOption "Boot module";
    };
  };

  config = mkIf cfg.enable {
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
  };
}
