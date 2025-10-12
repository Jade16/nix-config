{
  description = "AAAAAAAAAAAAAAAAAAAAAAAA";

  inputs = {
    #nixpkgs.url = "github:Scrumplex/nixpkgs/nixos-monado";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; # <<< Corrigido: vírgula adicionada
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # <<< Corrigido: vírgula adicionada

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix"; # <<< Corrigido: vírgula adicionada

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, agenix, ... } @inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      
      # <<< Estrutura dos módulos corrigida
      commonModules = [
        agenix.nixosModules.default
        home-manager.nixosModules.home-manager
        nixvim.nixosModules.nixvim
        # A configuração do home-manager para o usuário Jade foi movida
        # para o nixosConfigurations, conforme mostrado abaixo.
      ];

    in {
      # <<< Seção nixosConfigurations readicionada, que estava faltando
      nixosConfigurations = {
        jade-nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./machines/laptop/configuration.nix # <<< Verifique se este caminho está correto!
          ] ++ commonModules ++ [ # <<< Adicionando os módulos comuns e a config do HM
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jade = import ./home-manager/home.nix;
            }
          ];
        };
      };

      nixConfig = {
        experimental-features = [ "nix-command" "flakes" ];
        substituters = [ "https://cache.nixos.org/" ];
        extra-substituters = [
          "https://ow-mods.cachix.org"
          "https://nix-community.cachix.org"
        ];
        extra-trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCwyvRCYg3Fs="
          "ow-mods.cachix.org-1:6RTOd1dSRibA2W0MpZHxzT0tw1RzyhKObTPKQJpcrZo="
        ];
      };
    };
}
