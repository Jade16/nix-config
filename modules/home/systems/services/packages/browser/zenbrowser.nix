{ config, lib, pkgs, inputs, ... }:
# configuracao do ZenBrowser
{
  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
