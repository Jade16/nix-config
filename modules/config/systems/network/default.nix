{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.network.default;
in
{
 options = {
    systems.network = {
      enable = mkOption {
        type = types.bool;
        default = false; # Desligado por padrão
        description = "Enables network module (hostname, networkmanager).";
      };

      firewall = {
        enable = mkOption {
          type = types.bool;
          default = false; # Desligado por padrão
          description = "Enables firewall.";
        };
        tcp-ports = mkOption {
          type = types.listOf types.port;
          default = []; # Lista vazia por padrão
          description = "List of allowed TCP ports.";
        };
        udp-ports = mkOption {
          type = types.listOf types.port;
          default = []; # Lista vazia por padrão
          description = "List of allowed UDP ports.";
        };
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
