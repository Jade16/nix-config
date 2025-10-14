{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.network;
in
{
  options = {
   systems.network = {
      enable = true; # Ativa o módulo de rede inteiro
      firewall = {
        enable = true; # Ativa o firewall
        tcp-ports = [ 80 443 ]; # Exemplo: abrir portas para um servidor web
        udp-ports = [ 51820 ]; # Exemplo: abrir porta para WireGuard
      };
    }; 
  };

  config = mkIf cfg.enable {
    networking = {
      hostName = "jade-nixos";
      networkmanager.enable = true;

      # --- Bloco do Firewall Corrigido ---
      firewall = {
        # Descomentado para ativar
        enable = cfg.firewall.enable;
      
        # CORREÇÃO: ...PortRanges -> ...Ports
        allowedTCPPorts = cfg.firewall.tcp-ports;
        allowedUDPPorts = cfg.firewall.udp-ports;
      };
    };
  }; 
}
