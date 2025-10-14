# machines/laptop/configuration.nix

{ lib, config, pkgs, ... }:

{
  imports = [
    # A importação do modules.nix foi corretamente removida.
    ./hardware-configuration.nix
  ];

  # O bloco 'networking' do topo foi removido para não duplicar.

  system.stateVersion = "23.05"; # NAO MUDAR!

  # ===============================================================
  # ATIVANDO OS INTERRUPTORES DOS SEUS MÓDULOS CUSTOMIZADOS
  # ===============================================================

  tools = {
    development.git.enable = true;
    terminal = {
      #terminal.enable = true;
      kitty.enable = true;
      nvim.enable = true;
      zsh.zsh.enable = true; # CORRIGIDO: removido um '.zsh' extra
    };
  };

  hardware = {
    keyboard.br-abnt2.enable = true;
    printer = {
      enable = true;
      deskjet.enable = true; # Assumindo que você quer a impressora deskjet
    };
    scanner.enable = false;
    # CORRIGIDO: Usando o módulo de gráficos Intel que criamos
    screen.enable = true;
  };

  systems = {
    audio.pipewire.enable = true;
    bluetooth.enable = true;
    boot = {
      # CORRIGIDO: Caminho completo da opção e valor
      efi.mount-point = "/boot";
      
      # CORRIGIDO: Escolhendo apenas UM bootloader
      grub.enable = true;
      enable = false; # Desativa o módulo do systemd-boot
    };
    desktop = {
      autologin.enable = false;
      #hyprland.enable = false;
      #plasma6.enable = false;
      rofi.enable = true;
      services-user = {
        cliphist.enable = true;
        dunst.enable = true;
        wlsunset.enable = true;
      };
      sway.enable = true;
      waybar.enable = true;
    };
    font.nerd-font.enable = true;
    kernel.zen.enable = true;
    localization.brazil.enable = true;
    network = {
      enable = true; # CORRIGIDO: 'default' -> 'main'
      vpn.enable = true;
      # Configuração do firewall (exemplo)
      firewall = {
        enable = true;
        tcp-ports = [ 8080 ]; # Apenas um exemplo, configure como quiser
      };
    };
    nix = {
      trust.all = false;
      github-api-path = config.age.secrets.github-api.path;
    };
    power = {
      sleep.disable = true;
      management.enable = true;
    };
    services = {
      docker.enable = true;
      packages = {
        # CORRIGIDO: Caminho da opção de overlays
        overlays.enable = true; 
      };
    };
  };

  # CORRIGIDO: Caminho da opção do zenbrowser
  programs.zenbrowser.enable = true;
}
