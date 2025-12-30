{ pkgs, ... }:
# configuracao dos pacotes para o terminal
{
  environment.systemPackages = with pkgs; [
    # Pacotes que já estavam aqui
    git
    os-prober
    ntfs3g

    # Pacotes movidos do terminal.nix
    jq
    unzip
    zip

    tree 
  ];
}
