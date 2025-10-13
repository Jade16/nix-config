{
  description = "My config NixOS";

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
  outputs = { 
  self, 
  nixpkgs, 
  home-manager, 
  nixvim, 
  agenix, 
  ... 
  } @inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      jade-nixos = lib.nixosSystem {
        inherit system;
        
        # É uma boa prática passar os inputs para os módulos
        specialArgs = { inherit inputs; }; 
        
        modules = [
          # 1. Configuração específica do host (caminho corrigido)
          ./machines/laptop/configuration.nix

          # 2. Módulos de flakes externos que você usa
          home-manager.nixosModules.home-manager
          nixvim.nixosModules.nixvim
          agenix.nixosModules.default

        ] ++ (import ./modules/modules.nix); # 3. Importa e concatena TODOS os seus módulos da pasta /modules
      };
    };

    # A seção 'nixConfig' está OK, pode manter como está.
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
  
