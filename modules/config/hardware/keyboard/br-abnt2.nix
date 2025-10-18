{  config, lib, pkgs, ... }:

{
  console.keyMap = "br-abnt2";

  services.xserver = {
    layout = "br";
    xkbVariant = "abnt2";
  }; 
}

