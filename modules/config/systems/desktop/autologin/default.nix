{ config, pkgs, lib, ... }:

{
  services.greetd = {
    enable = true;
    settings.initial_session = {
      command = ''${pkgs.zsh}/bin/zsh -c "${pkgs.sway}/bin/sway"'';
      user = config.users.users.jade.name; # substitua 'jade' pelo seu usuário
    };
  };
}

