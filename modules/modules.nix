# mapeamento de todos os arquivos dos modulos
{ config, lib, pkgs, ... }:

{
[
  ### Hardware
  ./hardware/keyboard/br-abnt2.nix
  ./hardware/printer/default.nix
  ./hardware/printer/deskjet.nix
  ./hardware/scanner/default.nix
  ./hardware/screen/default.nix

  ### Systems
  ./systems/audio/pipewire.nix
  ./systems/bluetooth/default.nix
  ./systems/boot/efi.nix
  ./systems/boot/default.nix
  ./systems/boot/grub.nix
  ./systems/desktop/autologin/default.nix
  #./systems/default/hyprland.default.nix
  ./systems/desktop/plasma6/default.nix 
  ./systems/desktop/rofi/default.nix
  ./systems/desktop/services-user/cliphist/default.nix
  ./systems/desktop/services-user/dunst/default.nix
  ./systems/desktop/services-user/wlsunset/default.nix 
  ./systems/desktop/sway/default.nix  
  ./systems/desktop/waybar/default.nix
  ./systems/font/nerd-font.nix
  #./systems/gpu/nvidia.nix
  #./systems/gpu/nvidia-prime.nix
  ./systems/kernel/zen.nix
  ./systems/localization/brazil.nix
  ./systems/network/default.nix
  ./systems/network/vpn.nix
  ./systems/nix/agenix.nix
  ./systems/nix/default.nix
  ./systems/power/management.nix
  ./systems/power/sleep.nix
  ./systems/services/docker.nix
  ./systems/packages/browser/zenbrowser.nix
  ./systems/packages/default.nix
  ./systems/packages/overlays/overlays.nix
  ./systems/users/default.nix

  ### Tools
  ./tools/development/git.nix
  ./tools/terminal/default.nix
  ./tools/terminal/kitty/default.nix
  ./tools/terminal/nvim/default.nix
  ./tools/terminal/zsh/zsh.nix
  ];
  }
