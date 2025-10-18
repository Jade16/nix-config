{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
