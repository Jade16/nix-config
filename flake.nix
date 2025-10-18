{
  description = "NixOS + Home Manager modular setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./machines/laptop/configuration.nix
          ./modules/modules.nix

          # integração home-manager
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jade = import ./modules/modules-home.nix;
          }
        ];
      };
    };
}

