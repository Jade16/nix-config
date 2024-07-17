# This is your system's configuration file.
# Esse eh o arquivo de configuracoes do sistema

{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: 

{
  # You can import other NixOS modules here
  # Voce pode importar outros modulos NixOS aqui
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # Se voce quiser usar modulos que voce mesmo exposta em flakes (de modulos/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # Ou modulos de outros flakes (como hardware nixos)
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # Voce tambem pode dividir sua configuracao e importar partes dela aqui
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    # Importe sua configuracao de hardware gerada (nixos-generate-config)
    # REVER AQUI!!!
    ./hardware-configuration.nix
  ];


  nixpkgs = {
    # You can add overlays here
    # Voce pode adicionar overlays aqui
    # O QUE SAO OVERLAYS???
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # Adicione overlays que voce mesmo exporta em flakes (para overlays e pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

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
    ];
    # Configure your nixpkgs instance
    # Configure sua instancia nixpkgs
    # REVER AQUI!!!
    config = {
      # Disable if you don't want unfree packages
      # Desabilite se voce nao quiser packages nao gratuitas
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      # Habilite flakes e novo comando 'nix'
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      # Opitativo: desabilite registro global
      # O QUE SAO REGISTROS GLOBAIS EM NIX???
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      # Gambiarra para https://github.com/NixOS/nix/issues/9574
      # QUAL EH ESSE PROBLEMA???
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    # Opitativo: desabilite canais
    # O QUE SAO CANAIS EM NIX???
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    # Opitativo: fazer com que o registro do flake e o caminho nix correspondam as entradas do flake
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # FIXME: Add the rest of your current configuration
  # FIXE-ME: Adicione o resto da sua configuracao atual

  # TODO: Set your hostname
  # PENDENCIA: Defina seu hostname
  networking.hostName = "jadesnix";

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  # PENDENCIA: Defina as configuracoes de usuario em todo o sistema (grupos, etc) e adicione mais usuarios conforme necessario
  users.users = {
    # FIXME: Replace with your username
    # FIXE-ME: Substitua pelo seu nome de usuario
    # QUAL A DIFERENCA ENTRE HOSTNAME E USERNAME???
    jade = {
      # TODO: You can set an initial password for your user.
      #PENDENCIA: Voce pode definir uma senha inicial para o seu usuario
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Se fizer isso, voce pode pular a configuracao de uma senha de root passando '--no-root-passwd' para nixos-install
      # Be sure to change it (using passwd) after rebooting!
      # Certifique-se de altera-lo (usando passwd) apos reiniciar
      #initialPassword = "123456789";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
        # PENDENCIA: Adicione sua chave publica SSH aqui, se voce planeja usar SSH para se conectar
        # PORQUE E PARA QUE EU PLANEJARIA USAR SSH PARA CONECTAR???
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      # PENDENCIA: Certifique-se de adicionar quaisquer outros grupos necessarios (como networkmanager, audio, docker, etc)
      # EU USO ALGUM GRUPO??? O QUE E PARA QUE SERVEM ESSES GRUPOS???
      extraGroups = ["wheel"];
    };
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Isso configura o servidor SSH. Muito importante se você estiver configurando um sistema headless
  # O QUE EH UM SISTEMA HEADLESS???
  # Feel free to remove if you don't need it.
  # Sinta-se a vontade para remover se nao precisar
  # EU PRECISO???
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      # Opicional: proibir login root atraves de SSH
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Opicional: use apenas chaves
      # Remove if you want to SSH using passwords
      # Remove se quiser fazer SSH usando senhas
      PasswordAuthentication = false;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
  # MUDAR PARA 24.05???
}
