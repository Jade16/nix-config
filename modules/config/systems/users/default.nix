# modules/config/system/users.nix

{ pkgs, ... }:

{
  # --- FUNÇÃO 1: Criar o usuário 'jade' no sistema operacional ---
  users.users.jade = {
    isNormalUser = true;
    home = "/home/jade";
    description = "Jade";
    extraGroups = [
      "networkmanager"
      "wheel"    # Grupo importante, permite usar 'sudo'
      "video"
      "libvirtd" # Para virtualização
      "wireshark"
      # "docker" # Lembre-se: só adicione este se NÃO estiver usando o modo rootless do Docker
    ];
    shell = pkgs.zsh;
  };

  # --- FUNÇÃO 2: Fazer a ponte para o Home Manager ---
  home-manager = {
    # Configurações globais da integração
    useGlobalPkgs = true;
    useUserPackages = true;

    # A linha mais importante de todas:
    # Diz ao NixOS para usar o arquivo 'home.nix' para configurar o usuário 'jade'
    users.jade = import ../../../home/systems/users/default.nix;
  };
}
