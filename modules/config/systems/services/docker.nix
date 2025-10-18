{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
       docker-compose
    ];
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings = {
        #experimental = true;
        default-address-pools = [
          {
            base = "172.30.0.0/16";
            size = 24;
          }
        ];
      };
    };
    #users.extraGroups.docker.members = builtins.attrNames config.users.users;
  };
}
