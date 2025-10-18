{ config, lib, pkgs, ... }:

let
  cfg = config.systems.nix; # vamos supor que você queira usar systems.nix.trust
in
{
  options = {
    systems.nix.trust = {
      all = lib.mkEnableOption "Trust all users";
      users = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Lista de usuários confiáveis";
      };
    };
  };

  config = {
    nix.settings.trusted-users =
      if cfg.trust.all then builtins.attrnames config.users.users else cfg.trust.users;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}

