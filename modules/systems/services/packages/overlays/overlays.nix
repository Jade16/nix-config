{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.services.packages.overlays.overlays;
in
{
  options = {
    systems.packages.overlays.overlays = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables pipewire 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    # This one brings our custom packages from the 'pkgs' directory
    additions = final: _prev: import ../pkgs final.pkgs;

    # This one contains whatever you want to overlay
    # You can change versions, add patches, set compilation flags, anything really.
    # https://nixos.wiki/wiki/Overlays
    modifications = final: prev: {
      # example = prev.example.overrideAttrs (oldAttrs: rec {
      # ...
      # });
    };

    # When applied, the unstable nixpkgs set (declared in the flake inputs) will
    # be accessible through 'pkgs.unstable'
    unstable-packages = final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = final.system;
        config.allowUnfree = true;
      };
    };

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
  };
}
