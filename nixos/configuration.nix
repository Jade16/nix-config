# General settings for the NixOS System
# configuracoes gerais do meu NixOS 
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: 

{
  # Imports
  imports = [
    # Hardware configuration
    # configuracoes de hardware (apenas copiei da que ja tinha do meu computador, nao sei mexer nisso e nem acho que tenha que mexer em algo)
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager

    # Driver configuration
    #./driver-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;       
    efi.canTouchEfiVariables = true; 
    #systemd-boot.efiInstallAsRemovable = false;
    #systemd-boot.canTouchEfiVariables = true;
    #efi.efiSysMountPoint = "/boot/efi";  # partição EFI montada
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/E7C5-5C30";  # substitua pelo UUID correto
    fsType = "vfat";
  };

  boot.kernelParams = [
    "pci=nommconf"
    "pcie_aspm=off"
    "nvme_core.default_ps_max_latency_us=0"
  ];

   

  # Bluetooth
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Time Zone
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

  # Console keymap
  console.keyMap = "br-abnt2";

  # Swap via zram
  zramSwap.enable = true;

  # Enable sound with pipewire
  #sound.enable = true;
  #hardware.pulseaudio.enable = false;
  services.pulseaudio.enable = false;
  
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Hardware settings
  hardware = {
    # Enable OpenGL
    #opengl = {
      graphics = {
      enable = true;
      #driSupport = true;
      #driSupport32Bit = true;
    };
  };


  # Networking
  networking = {
    hostName = "jade-nixos";
    networkmanager.enable = true;
  };

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

  # User settings
  users.users = {
    # Username
    jade = {
      isNormalUser = true;
      home = "/home/jade";
      description = "jade";
      extraGroups = ["networkmanager" "wheel" "video" "libvirtd" "wireshark" "docker"];
      shell = pkgs.zsh;
    };
  }; 

  # Home Manages
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jade = {
      imports = [
        ../home-manager/home.nix
        inputs.nixvim.homeManagerModules.nixvim
      ];
    };
  };

  # Fonts
  #fonts.packages = with pkgs; [(pkgs.nerdfonts.override {fonts = ["Go-Mono"];})];
  fonts.packages = with pkgs; [
    nerd-fonts.go-mono
  ];
   

  # Security
  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "sqldeveloper"
    ];
    permittedInsecurePackages = [
      "oraclejdk-8u281"
    ];
    packageOverrides = pkgs: rec {
      umlet = pkgs.umlet.override{
        jre = pkgs.oraclejre8;
        jdk = pkgs.oraclejdk8;
      };
    };
    cudaSupport = true;
  };
  
  # Enable experimental features (Flakes)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #fonts.fontDir.enable = true;

  # Enable home-manager and git
  programs = {
    git.enable = true;
    zsh.enable = true;    
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  # Additional system packages
  environment.systemPackages = with pkgs; [
    zsh
    neovim
    docker-compose 
  ];

  # Greeter
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
  # NÃO MUDAR
  system.stateVersion = "23.05";
}
