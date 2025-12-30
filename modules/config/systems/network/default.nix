{ config, lib, pkgs, ... }:
# configuracao de rede
{
  config = {
    networking.hostName = "jade-nixos";
    networking.networkmanager.enable = true;
    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [ 22 80 443 ]; # suas portas
    networking.firewall.allowedUDPPorts = [ 123 ];     
  };
}

