# modules/home/tools/terminal.nix
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    unzip
    zip
    # E outras ferramentas que você quer só para seu usuário
  ];
}
