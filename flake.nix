{
  description = "My config NixOS";

  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable"; 

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix"; 
    
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
    modules = [
        agenix.nixosModules.default
        home-manager.nixosModules.home-manager
        nixvim.nixosModules.nixvim
      ]; 
  in {
    nixosConfigurations = {
      jade-nixos = lib.nixosSystem {
        inherit system;
        #inherit pkgs;        
        modules = [ ./machines/laptop/configuration.nix ] ++ modules;
      };
    };

    nixConfig = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://cache.nixos.org/"
        "https://ow-mods.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCwyvRCYg3Fs="
        "ow-mods.cachix.org-1:6RTOd1dSRibA2W0MpZHxzT0tw1RzyhKObTPKQJpcrZo="
      ];
    };
  };
} 
  
