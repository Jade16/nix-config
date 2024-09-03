# General settings for the NixOS System
# aqui eu vou colocar as configurações do meu os gerais 

{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: 

{
  # Imports
  imports = [
    # Generated hardware configuration (nixos-generate-config)
    ./hardware-configuration.nix

    # Driver configuration
    ./driver-configuration.nix
  ];

  # Boot
  boot = {
    loader = {
      # O QUE EH ISSO??
      systemd-boot.enable = true;
      # O QUE EH ISSO??
      efi.canTouchEfiVariables = true;
    };
  };

  # Time Zone
  time.timeZone = "America/Sao_Paulo";

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

  # Enable the X11 windowing system and the GNOME Desktop Environment
  services = {
    # O QUE EH ISSO?
    xserver = {
      enable = true;

      # Configure keymap in X11
      layout = "br";
      xkbVariant = "";

      # O QUE EH ISSO??
      displayManager = {
        gdm.enable = true;
        gnome.enable = true;
      };
    };

    # Enable CUPS to print documents
    printing.enable = true;

    # OpenSSH
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
  };

  # Enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  # Enable home-manager and git
  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  # Networking
  networking = {
    networkmanager.enable = true;
  };

  # XDG portal settings
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    # config = {
      # common.default = ["gnome"];
    # };
  };

  # User settings
  users.users = {
    # Username
    jade = {
      isNormalUser = true;
      home = "/home/jade";
      description = "jade";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.zsh;
      
      # openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
        # PENDENCIA: Adicione sua chave publica SSH aqui, se voce planeja usar SSH para se conectar
        # PORQUE E PARA QUE EU PLANEJARIA USAR SSH PARA CONECTAR???
      # ];
    };
  }; 

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable experimental features (Flakes)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.fontDir.enable = true;



  #nixpkgs = {
    # You can add overlays here
    # Voce pode adicionar overlays aqui
    # O QUE SAO OVERLAYS???
    #overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # Adicione overlays que voce mesmo exporta em flakes (para overlays e pkgs dir):
      #outputs.overlays.additions
      #outputs.overlays.modifications
      #outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # Voce pode tambem adicionar overlays exportadas de outros flakes
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # Ou defina-o inline, por exemplo:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    #];
    # Configure your nixpkgs instance
    # Configure sua instancia nixpkgs
    # REVER AQUI!!!
    #config = {
      # Disable if you don't want unfree packages
      # Desabilite se voce nao quiser packages nao gratuitas
      #allowUnfree = true;
    #};
  #};

  #nix = let
    #flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  #in {
    #settings = {
      # Enable flakes and new 'nix' command
      # Habilite flakes e novo comando 'nix'
      #experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      # Opitativo: desabilite registro global
      # O QUE SAO REGISTROS GLOBAIS EM NIX???
      #flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      # Gambiarra para https://github.com/NixOS/nix/issues/9574
      # QUAL EH ESSE PROBLEMA???
      #nix-path = config.nix.nixPath;
    #};
    # Opinionated: disable channels
    # Opitativo: desabilite canais
    # O QUE SAO CANAIS EM NIX???
    #channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    # Opitativo: fazer com que o registro do flake e o caminho nix correspondam as entradas do flake
    #registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    #nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  #};

  # FIXME: Add the rest of your current configuration
  # FIXE-ME: Adicione o resto da sua configuracao atual

  # TODO: Set your hostname
  # PENDENCIA: Defina seu hostname
  #networking.hostName = "jadesnix";

  

  

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
  # MUDAR PARA 24.05???
}
