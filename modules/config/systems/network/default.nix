{ config, lib, pkgs, ... }:
# configuracao de rede
{
  networking = { 
    hostName = "jade-nixos";
    networkmanager.enable = true;
    firewall.enable = true;
    #firewall.allowedTCPPorts = [ 22 80 443 ]; # suas portas
    #firewall.allowedUDPPorts = [ 123 ];     
  };
}

