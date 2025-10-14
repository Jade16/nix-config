{ config, lib, ... }:

lib.mkIf config.systems.desktop.services-user.cliphist.enable {

  services.cliphist.enable = true; # Histórico da área de transferência

}
