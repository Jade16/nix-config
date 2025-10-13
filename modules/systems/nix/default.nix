{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.nix;
in
{
  options = {
    systems.nix = {
      trust = {
        all = mkOption {
          default = false;
          type = types.bool;
          description = ''
            trust all users 
          '';
        };
        users = mkOption {
          default = [ ];
          type = types.listOf types.str;
          description = ''
            trusted users list 
          '';
        };
      };
      github-api-path = mkOption {
        type = types.path;
        description = ''
          path for github-api file for nix
        '';
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
    
    home-manager.users.jade = {
      services.gpg-agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-gtk2; # <--- CORRIGIDO
        defaultCacheTtl = 600;                # <--- CORRIGIDO
        enableSshSupport = true;              # <--- CORRIGIDO
        defaultCacheTtlSsh = 600;             # <--- CORRIGIDO
      };  
    };
  };
}
