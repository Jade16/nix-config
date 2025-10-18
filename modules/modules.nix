{ ... }:
{
  imports = [
    ### Hardware
    ./config/hardware/keyboard/br-abnt2.nix
    ./config/hardware/printer/default.nix
    ./config/hardware/printer/deskjet.nix
    ./config/hardware/scanner/default.nix
    ./config/hardware/screen/default.nix

    ### Systems
    ./config/systems/audio/pipewire.nix
    ./config/systems/boot/efi.nix
    ./config/systems/boot/default.nix
    ./config/systems/boot/grub.nix

    ./config/systems/desktop/autologin/default.nix 
    ./config/systems/desktop/rofi/default.nix
    ./config/systems/desktop/services-user/cliphist/default.nix
    ./config/systems/desktop/services-user/dunst/default.nix
    ./config/systems/desktop/services-user/wlsunset/default.nix 
    ./config/systems/desktop/sway/default.nix  
    ./config/systems/desktop/waybar/default.nix
    ./config/systems/font/nerd-font.nix
    ./config/systems/gpu/nvidia.nix
    ./config/systems/gpu/nvidia-prime.nix
    ./config/systems/kernel/zen.nix
    ./config/systems/localization/brazil.nix
    ./config/systems/network/default.nix
    ./config/systems/network/vpn.nix
    ./config/systems/nix/agenix.nix
    ./config/systems/nix/default.nix
    ./config/systems/power/management.nix
    ./config/systems/power/sleep.nix
    ./config/systems/services/docker.nix
    ./config/systems/users/default.nix

    ### Tools
    ./config/tools/development/git.nix
    ./config/tools/terminal/default.nix
    ./config/tools/terminal/kitty/default.nix
    ./config/tools/terminal/nvim/default.nix
    ./config/tools/terminal/zsh/default.nix
    ];
  }
