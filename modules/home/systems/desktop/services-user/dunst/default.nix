{ config, lib, ... }:

# Ativa a configuração somente se o interruptor do NixOS estiver ligado
lib.mkIf config.systems.desktop.services-user.dunst.enable {

  services.dunst = {
    enable = true;
    settings.global = {
      font = "GoMono Nerd Font Mono 16";
    };
  };

}
