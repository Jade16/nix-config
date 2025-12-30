{ config, lib, pkgs, ... }:
#configuracao do bluetooth
{    
  services.blueman.enable = true;       
  hardware.bluetooth.enable = true;     
  hardware.bluetooth.powerOnBoot = true;
}
