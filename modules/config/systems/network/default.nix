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
      enable = mkEnableOption "network module";
    };
    firewall = {
      enable = mkEnableOption "Enables firewall";
      tcp-ports = mkOption {
        type = types.listOf types.port;
        default = [];
        description = "List of allowed TCP ports.";
      };
      udp-ports = mkOption {
        type = types.listOf types.port;
        default = []; 
        description = "List of allowed UDP ports.";
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
