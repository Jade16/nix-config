{  config, lib, pkgs, ... }:

{
  services.printing.enable = true;
  services.printing.browsed.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
