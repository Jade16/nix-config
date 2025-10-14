{ config, lib, pkgs, inputs, ... }:

# Ativa a configuração somente se o interruptor do NixOS estiver ligado
lib.mkIf config.programs.zenbrowser.enable {

  # Adiciona o pacote à lista do Home Manager, não do sistema
  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.default
  ];

}
