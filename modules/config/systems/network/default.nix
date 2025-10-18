{
  config,
  lib,
  pkgs,
  ...
}:
{
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
