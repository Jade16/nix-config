{
  description = "My nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # Remova o nixpkgs-unstable se não for usar, ou use-o para pacotes específicos
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix Vim 
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Package do Zen Browser 
    zen-browser.url = "github:youwen5/zen-browser-flake"; 
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    // highlight-start
    # Adicione o agenix para gerenciamento de segredos
    agenix.url = "github:ryantm/agenix";
    // highlight-end
  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager,
    nixvim,
    zen-browser,
    agenix, // highlight-line
    ...
  }@inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    
    // highlight-start
    # Configurações comuns de pkgs para sistemas NixOS
    commonPkgsConfig = {
      config = {
        allowUnfree = true;
        # permittedInsecurePackages = [ ... ]; # Adicione se necessário
      };
      overlays = [
        # Inclua overlays personalizados, como o do zen-browser se disponível
        # zen-browser.overlays.default 
      ] ++ (import ./overlays {inherit inputs;});
    };
    // highlight-end
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;

    // highlight-start
    # Módulos comuns para todas as configurações NixOS
    commonModules = [
      agenix.nixosModules.default
      home-manager.nixosModules.home-manager
      nixvim.nixosModules.nixvim
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        # home-manager.users.jade = import ./home-manager/home.nix; # Mova para a configuração específica da máquina
      }
    ];
    // highlight-end

    nixosConfigurations = {
      jade-nixos = nixpkgs.lib.nixosSystem {
        // highlight-start
        specialArgs = {inherit inputs outputs;};
        modules = [ 
          ./nixos/configuration.nix
        ] ++ commonModules;
        // highlight-end
      };
    };

    homeConfigurations = {
      "jade@jade-nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home-manager/home.nix
        ];
      };
    };

    // highlight-start
    # Configuração do Nix para substituters (cache)
    nixConfig = {
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    // highlight-end
  };
}
