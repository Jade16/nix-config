{  config, lib, pkgs, ... }:

{
  # ADICIONADO: Ativa o próprio Sway
  programs.sway.enable = true;

  # Security (suas configurações já estavam corretas)
  security.polkit.enable = true;
  security.pam.services.swaylock = {};
}
