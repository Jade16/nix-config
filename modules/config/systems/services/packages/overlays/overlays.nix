{ lib, config, inputs, pkgs, ... }:
# configuracao de pacotes (nixpkgs) com overlay instavel
{
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
      let name = lib.getName (pkg // { name = ""; });
      in builtins.elem name [ "sqldeveloper" ];
    permittedInsecurePackages = [ 
      "oraclejdk-8u281"
      "qtwebengine-5.15.19"
    ];
     
    cudaSupport = true;
  };
}

