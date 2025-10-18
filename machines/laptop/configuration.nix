{ lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # --- Hardware ---
    ../../modules/config/hardware/keyboard/br-abnt2.nix
    ../../modules/config/hardware/printer/default.nix
    ../../modules/config/hardware/scanner/default.nix
    ../../modules/config/hardware/screen/default.nix

    # --- Sistemas ---
    ../../modules/config/systems/audio/pipewire.nix
    ../../modules/config/systems/bluetooth/default.nix
    ../../modules/config/systems/boot/default.nix
    ../../modules/config/systems/boot/efi.nix
    ../../modules/config/systems/boot/grub.nix  
    ../../modules/config/systems/desktop/services-user/cliphist/default.nix
    ../../modules/config/systems/desktop/sway/default.nix
    ../../modules/config/systems/desktop/waybar/default.nix
    ../../modules/config/systems/font/nerd-font.nix
    #../../modules/config/systems/gpu/nvidia.nix
    ../../modules/config/systems/kernel/zen.nix
    ../../modules/config/systems/localization/brazil.nix
    ../../modules/config/systems/network/default.nix
    ../../modules/config/systems/nix/default.nix
    ../../modules/config/systems/power/management.nix
    ../../modules/config/systems/power/sleep.nix
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

    # Define o usuário e importa as configurações do home.nix
    users.jade = import ../../home/jade/home.nix;
  };

}
