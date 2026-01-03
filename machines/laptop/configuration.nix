{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: 

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
    #../../modules/config/systems/bluetooth/default.nix
    #../../modules/config/systems/boot/default.nix
    #../../modules/config/systems/boot/efi.nix
    #../../modules/config/systems/boot/grub.nix 
    #../../modules/config/systems/desktop/hyprland/default.nix

    #../../modules/config/systems/font/nerd-font.nix
    #../../modules/config/systems/gpu/nvidia.nix
    #../../modules/config/systems/kernel/zen.nix
    #../../modules/config/systems/localization/brazil.nix
    #../../modules/config/systems/network/default.nix
    #../../modules/config/systems/nix/default.nix
    #../../modules/config/systems/power/management.nix
    #../../modules/config/systems/power/sleep.nix
    #../../modules/config/systems/services/docker.nix
    #../../modules/config/systems/services/packages/default.nix
    #../../modules/config/systems/services/packages/overlays/overlays.nix

    # --- Usuários ---
    #../../modules/config/systems/users/default.nix

    # --- Tools ---
    #../../modules/config/tools/terminal/default.nix
  ];

### User settings
  users.users = {
    # Username
    jade = {
      isNormalUser = true;
      home = "/home/jade";
      description = "jade";
      extraGroups = [
        "networkmanager" 
        "wheel" 
        "video" 
        "libvirtd" 
        "wireshark" 
        "docker"];
      shell = pkgs.zsh;
    };
  }; 
###

### Configurações do Home Manager integradas ao NixOS
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup"; 
    users.jade = {
      imports = [
        ./home.nix
        #inputs.nixvim.homeManagerModules.nixvim
      ];
    }; 
    # Define o usuario e importa as configurações do home.nix
    #users.jade = import ../../modules/home/systems/users/default.nix; 
  };
###

### Packages para as fontes utilizadas
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-color-emoji  
  ];
###

  #environment.systemPackages = with pkgs; [
    #papirus-icon-theme
  #];

### Configuracao do boot loader
  boot.loader = {
    systemd-boot.enable = true;       
    efi.canTouchEfiVariables = true; 
  };
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/E7C5-5C30";
    fsType = "vfat";
  };
  boot.kernelParams = [
    "pci=nommconf"
    "pcie_aspm=off"
    "nvme_core.default_ps_max_latency_us=0"
  ];
###

### Configuracao Bluetooth
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
###

### Configuracao da localizacao
  time.timeZone = "America/Sao_Paulo";
  time.hardwareClockInLocalTime = true;
  # Internationalisation properties
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };
###

### Configuracao do teclado
  console.keyMap = "br-abnt2";
###

### Configuracao do Swap via zram
  zramSwap.enable = true;
###

### Configuracao de audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
###

### Configuracao da Tela
  hardware = {
    graphics = {
      enable = true;
    };
  };
###

### Configuracao de rede
  networking = {
    hostName = "jade-nixos";
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd"; 
  };
###

### Configuracao de brilho
  programs.light.enable = true;
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings = {
        screencast = {
          max_fps = 30;
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        };
      };
    };
    config.common.default = "*";
  };
###

### Security
  security.polkit.enable = true;
  security.pam.services.swaylock = {};
###

### Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "sqldeveloper"
    ];
    permittedInsecurePackages = [
      "oraclejdk-8u281i"
      "qtwebengine-5.15.19"
       
    ];
    packageOverrides = pkgs: rec {
      umlet = pkgs.umlet.override{
        jre = pkgs.oraclejre8;
        jdk = pkgs.oraclejdk8;
      };
    };
    cudaSupport = true;
  };
###

### Enable experimental features (Flakes)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
###

### Enable home-manager and git
  programs = {
    git.enable = true;
    zsh.enable = true;    
  };
### 

### Configuracao do Docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  systemd.services.docker.environment = {
    HTTP_PROXY = "http://webproxy.ext.ti.com:80";
    HTTPS_PROXY = "http://webproxy.ext.ti.com:80";
    NO_PROXY = "localhost,127.0.0.1";
  }; 
###
  
### Additional system packages
  environment.systemPackages = with pkgs; [
    zsh
    neovim
    docker-compose 
  ];
###

### Greeter
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = ''${pkgs.zsh}/bin/zsh -c "${pkgs.sway}/bin/sway"'';
        user = "jade";
      };
      default_session = initial_session;
    };
  };
###
  
### NAO MUDAR!!!
  system.stateVersion = "23.05";
###
}
