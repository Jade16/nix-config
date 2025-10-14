#{
#  config,
#  lib,
#  pkgs,
#  ...
#}:

#with lib;
#let
#  cfg = config.hardware.keyboard.br-abnt2;
#in
#{
#  options = {
#    hardware.keyboard.br-abnt2 = {
#      enable = mkOption {
#        default = false;
#        type = types.bool;
#        description = ''
#          Enables ABNT2 keyboard 
#        '';
#      };
#    };
#  };

#  config = mkIf cfg.enable {
#    console.keyMap = "br-abnt2";
    # Layout gráfico (X11/Wayland)
#    i18n.inputLocale = "pt_BR.UTF-8"; 
#  };
#}

{ config, lib, pkgs, ... }:

{
  # Aplica o layout ABNT2 diretamente
  console.keyMap = "br-abnt2";

  # Layout gráfico (X11/Wayland)
  i18n.inputLocale = "pt_BR.UTF-8";
}

