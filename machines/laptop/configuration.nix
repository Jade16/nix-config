{ lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # --- Hardware ---
    #../../modules/config/hardware/keyboard/br-abnt2.nix
    #../../modules/config/hardware/printer/default.nix
    #../../modules/config/hardware/scanner/default.nix
    #../../modules/config/hardware/screen/default.nix

    # --- Sistemas ---
    #../../modules/config/systems/audio/pipewire.nix
    ../../modules/config/systems/bluetooth/default.nix
    ../../modules/config/systems/boot/default.nix
    #../../modules/config/systems/boot/efi.nix
    #../../modules/config/systems/boot/grub.nix 
    #../../modules/config/systems/desktop/hyprland/default.nix

    #../../modules/config/systems/font/nerd-font.nix
    #../../modules/config/systems/gpu/nvidia.nix
    #../../modules/config/systems/kernel/zen.nix
    ../../modules/config/systems/localization/brazil.nix
    ../../modules/config/systems/network/default.nix
    ../../modules/config/systems/nix/default.nix
    #../../modules/config/systems/power/management.nix
    #../../modules/config/systems/power/sleep.nix
    ../../modules/config/systems/services/docker.nix
    ../../modules/config/systems/services/packages/default.nix
    ../../modules/config/systems/services/packages/overlays/overlays.nix

    # --- Usuários ---
    ../../modules/config/systems/users/default.nix

    # --- Tools ---
    ../../modules/config/tools/terminal/default.nix
  ];

  system.stateVersion = "23.05"; # NAO MUDAR!

# Configurações do Home Manager integradas ao NixOS
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "backup"; 

    # Define o usuário e importa as configurações do home.nix
    users.jade = import ../../modules/home/systems/users/default.nix; 
  };
  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-emoji
  ];

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
  ];

 ######################################################
  # XDG portal settings
  # brilho
  programs.light.enable = true;

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings = {
        screencast = {
          max_fps = 30;
          chooser_type = "simple";
          #???
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        };
      };
    };
    config.common.default = "*";
  };
  
  # Security
  security.polkit.enable = true;
  security.pam.services.swaylock = {};
 
  systemd.services.docker.environment = {
    HTTP_PROXY = "http://webproxy.ext.ti.com:80";
    HTTPS_PROXY = "http://webproxy.ext.ti.com:80";
    NO_PROXY = "localhost,127.0.0.1";
  };


  # Greeter
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = ''${pkgs.zsh}/bin/zsh -c "${pkgs.hyprland}/bin/Hyprland"'';
        user = "jade";
      };
      default_session = initial_session;
    };
  };
}
