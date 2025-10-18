{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = mkIf cfg.enable {
    services.mullvad-vpn.enable = true;
    #programs.openvpn3.enable = true;
  };
}
