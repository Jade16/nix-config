{ lib, config, inputs, pkgs, ... }:

with lib;
let
  cfg = config.systems.services.packages.overlays;
in
{
  options.systems.services.packages.overlays.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable custom overlays and Nixpkgs configurations.";
  };

  config = mkIf cfg.enable {

    nixpkgs.overlays = [
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          system = pkgs.stdenv.hostPlatform.system;
          config.allowUnfree = true;
        };
      })
    ];

    nixpkgs.config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg:
        let name = lib.getName (pkg or { name = ""; });
        in builtins.elem name [ "sqldeveloper" ];
      permittedInsecurePackages = [ "oraclejdk-8u281" ];
      cudaSupport = true;
    };
  };
}

