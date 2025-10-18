{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = mkIf cfg.enable {
    services.printing.enable = true;
    services.printing.browsed.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
