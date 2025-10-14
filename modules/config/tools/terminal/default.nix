# Em modules/config/system/packages.nix
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Pacotes que já estavam aqui
    git
    os-prober
    ntfs3g
    # ... etc

    # Pacotes movidos do terminal.nix
    jq
    unzip
    zip
    # zsh (já deve estar aqui)
    # neovim (já deve estar aqui)
  ];

  # ... outras configs de pacotes, como VirtualBox
}
