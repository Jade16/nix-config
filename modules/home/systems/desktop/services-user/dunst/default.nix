{ config, lib, ... }:

{
  services.dunst = {
    enable = true;
    settings.global = {
      font = "GoMono Nerd Font Mono 16";
    };
  };
}
