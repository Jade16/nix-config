{ config, lib, pkgs, ... }:

{
  config = {
    networking.hostName = "jade-nixos";
    networking.networkmanager.enable = true;

    networking.firewall.enable = true; # apenas defina true ou false
    networking.firewall.allowedTCPPorts = [ 22 80 443 ]; # suas portas
    networking.firewall.allowedUDPPorts = [ 123 ];     
  };
}

