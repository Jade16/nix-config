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
            Trust all users 
          '';
        };
        users = mkOption {
          default = [ ];
          type = lib.types.nonEmptyListOf lib.types.str;
          description = ''
            Trusted users list 
          '';
        };
      };
      github-api-path = mkOption {
        type = types.path;
        description = ''
          Path for github-api file for nix
        '';
      };
    };
  };

  config = {
    nix.settings.trusted-users =
      if cfg.trust.all then builtins.attrNames config.users.users else cfg.trust.users;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Allow unfree packages
    nixpkgs.config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "sqldeveloper"
      ];
      permittedInsecurePackages = [
        "oraclejdk-8u281"
      ];
      packageOverrides = pkgs: rec {
        umlet = pkgs.umlet.override{
          jre = pkgs.oraclejre8;
          jdk = pkgs.oraclejdk8;
        };
      };
      cudaSupport = true;
    }; 
    #nix.extraOptions = ''
      #!include ${cfg.github-api-path}
    #'';
    #programs.nh = {
      #enable = true;
      #clean.enable = true;
      #clean.extraArgs = "--keep-since 4d --keep 3";
      #flake = "/home/locochoco/.dotfiles"; # sets NH_OS_FLAKE variable for you
    #};
  };
}
