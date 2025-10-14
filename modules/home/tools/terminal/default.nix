# modules/home/tools/terminal.nix
{ config, lib, pkgs, ... }:

# Note que este agora é um módulo do Home Manager
lib.mkIf config.tools.terminal.enable {

  home.packages = with pkgs; [
    jq
    unzip
    zip
    # E outras ferramentas que você quer só para seu usuário
  ];

}
