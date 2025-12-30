{  config, lib, pkgs, ... }:
# configuracao de teclado para NixOS
{
  console.keyMap = "br-abnt2";

  services.xserver = {
    layout = "br";
    xkbVariant = "abnt2";
  }; 
}

