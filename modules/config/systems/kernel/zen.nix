{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.kernel.zen;
in
{
  options = {
    systems.kernel.zen = {
      enable = mkEnableOption"Enables the Zen Linux kernel";
    };
  };

  config = mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
