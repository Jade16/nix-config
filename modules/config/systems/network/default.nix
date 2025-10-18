{ config, lib, pkgs, ... }:

let
  cfg = config.networking; # não é necessário para opções novas, só para ler valores existentes
in
{
  options = {
    networking.firewall = {
      enable = lib.mkEnableOption "Enable firewall";
      tcp-ports = lib.mkOption {
        type = lib.types.listOf lib.types.int;
        default = [ ];
        description = "Lista de portas TCP permitidas";
      };
      udp-ports = lib.mkOption {
        type = lib.types.listOf lib.types.int;
        default = [ ];
        description = "Lista de portas UDP permitidas";
      };
    };
  };

  config = {
    networking.hostName = "jade-nixos";
    networking.networkmanager.enable = true;

    networking.firewall.enable = config.networking.firewall.enable;
    networking.firewall.allowedTCPPorts = config.networking.firewall.tcp-ports;
    networking.firewall.allowedUDPPorts = config.networking.firewall.udp-ports;
  };
}

