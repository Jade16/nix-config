{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = mkIf cfg.enable {
    hardware.sane.enable = true;
    environment.systemPackages = with pkgs; [
      xsane
      kdePackages.skanpage
    ];
  };
}
