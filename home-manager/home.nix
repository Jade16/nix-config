# Home manager settings
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../modules/home-manager
    ./home_packages.nix
  ];

  home = {
    username = "jade";
    homeDirectory = "/home/jade";
  };

  home.sessionPath = ["$HOME/.local/bin"];
  # Env vars
  home.sessionVariables = {
    EDITOR = "nvim";
    GTK_THEME = "Adwaita:dark";
  };

  # Clipboard manager - historico do ctrl c + d
  services.cliphist.enable = true;

  # Night light
  services.wlsunset = {
    enable = true;
    temperature.night = 3000;

    # Arbitrary latitude longitude pair set to São Paulo
    # (should have been based on locale but whatever)
    latitude = "-23.55";
    longitude = "-46.63";
  };

  # Notification service
  services.dunst = {
    enable = true;
    settings.global = {
      font = "GoMono Nerd Font Mono 16";
    };
  };

  # Direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  # System diagostics
  xdg.configFile."btop/themes/btop.theme".source = ../extra-configs/btop.theme;

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "${config.xdg.configHome}/btop/themes/btop.theme";
      theme_background = false;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  # O QUE EH ISSO????

  #home.file."/home/jade/.config/fontconfig/conf.d/10-hm-fonts.conf".source = ...;
   

  # NÃO MUDAR ISSO, NUNCA
  home.stateVersion = "23.05";
}
