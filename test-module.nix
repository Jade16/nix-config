# test-bluetooth.nix
let
  homeLib = import ./modules/lib/stdlib-extended.nix (import <nixpkgs> {});
  pkgs = import <nixpkgs> {};
  config = {
    bluetooth.enable = true;
  };
  bluetoothModule = import ./modules/config/systems/bluetooth/default.nix {
    inherit pkgs;
    lib = homeLib;
    inherit config;
  };
in
{
  options = bluetoothModule.options;
  config = bluetoothModule.config;
}

#nix eval -f test-module.nix

