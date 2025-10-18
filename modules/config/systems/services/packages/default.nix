{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Ferramentas de Boot
    os-prober
    ntfs3g

    # Acesso Remoto
    anydesk

    # Terminais (bom ter a nível de sistema)
    kitty
    wezterm

    # Ferramentas de Desenvolvimento Base
    git
    gnumake
    gnat  # Compilador Ada (GCC)
    gdb   # Debugger

    # Wayland/UI Utilities (bom ter a nível de sistema para scripts de login)
    swaylock
    swaybg
    grim
    slurp
    wl-clipboard
    wl-mirror
    wlsunset

    # VPN
    openconnect

    # Ferramentas de Linha de Comando Essenciais
    fzf
    ripgrep
    zip
    unzip
    file
    findutils
    jq
    neovim # Editores base são bons a nível de sistema
    zsh

    # Ferramentas de Segurança Base
    gnupg
    openssl
  ];

  # Ativa o VirtualBox corretamente (com módulos de kernel)
  virtualisation.virtualbox.host.enable = true;
}
