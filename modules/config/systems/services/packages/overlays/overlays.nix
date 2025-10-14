# modules/config/systems/services/packages/overlays/overlays.nix

{ lib, config, inputs, pkgs, ... }:

with lib;
let
  cfg = config.systems.services.packages.overlays;
in
{
  # ====================================================================
  # PARTE 1: Declarar a opção (continua perfeita)
  # ====================================================================
  options.systems.services.packages.overlays.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable custom overlays and Nixpkgs configurations.";
  };

  # ====================================================================
  # PARTE 2: Usar a opção (agora unificada e correta)
  # ====================================================================
  config = mkIf cfg.enable {

    # A única forma de modificar pacotes será através desta lista
    nixpkgs.overlays = [
    # Overlay para pacotes instáveis
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit system; 
          config.allowUnfree = true;
        };
      })
    ];

    # O 'nixpkgs.config' agora fica muito mais simples e não tem mais 'packageOverrides'
    nixpkgs.config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "sqldeveloper" ];
      permittedInsecurePackages = [ "oraclejdk-8u281" ];
      cudaSupport = true;
      # <<<<<<< BLOCO 'packageOverrides' COMPLETAMENTE REMOVIDO DAQUI <<<<<<<
    };
  };
}
