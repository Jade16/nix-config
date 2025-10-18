{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = mkIf cfg.disable {
    systemd.sleep.extraConfig = ''
      AllowSuspend=no
      AllowHibernation=no
      AllowHybridSleep=no
      AllowSuspendThenHibernate=no
    '';
  };
}
