{  config, lib, pkgs, ... }:
# configuracao da fonte
{
  fonts.packages = with pkgs; [
    nerd-fonts.go-mono 
  ];
}
