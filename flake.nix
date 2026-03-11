{
  description = "Minha configuração NixOS com Flakes";

  inputs = {
    # Define a fonte dos pacotes (nixpkgs).
    # 'nixos-unstable' é ótimo para desktop/Hyprland, mas use 'nixos-24.11' se preferir estabilidade.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # IMPORTANTE: Substitua 'nixos' abaixo pelo seu HOSTNAME real
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          # O hardware-configuration já costuma ser importado dentro do configuration.nix,
          # mas se não estiver, descomente a linha abaixo:
          # ./hardware-configuration.nix
        ];
      };
    };
  };
}