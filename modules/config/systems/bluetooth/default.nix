{ config, lib, pkgs, ... }:

{    
  services.blueman.enable = true;       
  hardware.bluetooth.enable = true;     
  hardware.bluetooth.powerOnBoot = true;
}
