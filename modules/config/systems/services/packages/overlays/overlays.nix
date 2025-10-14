# Em .../overlays/overlays.nix

{ lib, config, inputs, ... }:

with lib;
# O bloco 'let' foi removido.
{
  # ====================================================================
  # PARTE 1: Declarar a opção (isso já estava correto)
  # ====================================================================
  options.systems.services.packages.overlays.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable custom overlays and Nixpkgs configurations.";
  };

  # ====================================================================
  # PARTE 2: Usar a opção (com o caminho completo e correto)
  # ====================================================================
  config = mkIf config.systems.services.packages.overlays.enable (
    let
      # Os overlays continuam como variáveis locais, isso está correto.
      additions = final: _prev: import ../pkgs final.pkgs;

      modifications = final: prev: {
        # example = prev.example.overrideAttrs (oldAttrs: rec { ... });
      };

      unstable-packages = final: _prev: {
        unstable = import inputs.nixpkgs-unstable {
          system = final.system;
          config.allowUnfree = true;
        };
      };
    in
    {
      nixpkgs.overlays = [
        additions
        modifications
        unstable-packages
      ];

      nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
          "sqldeveloper"
        ];
        permittedInsecurePackages = [
          "oraclejdk-8u281"
        ];
        packageOverrides = pkgs: rec {
          umlet = pkgs.umlet.override {
            jre = pkgs.oraclejre8;
            jdk = pkgs.oraclejdk8;
          };
        };
        cudaSupport = true;
      };
    }
  );
}
