{  config, lib, pkgs, ... }:
# configuracao de vpn
{
  services.mullvad-vpn.enable = true;
  #programs.openvpn3.enable = true;
}
