{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:{
  
  # Packages
  home.packages = with pkgs; [
    # browsers
    brave

    # terminal
    kitty

    # editor
    sublime

    # git
    git

    # make
    gnumake

    # gcc
    gnat

    # debuger
    gdb
    
    # video
    stremio

    # leitor pdf
    libsForQt5.okular

    # editor imagens
    inkscape-with-extensions
    gimp-with-plugins

    # editor de video
    libsForQt5.kdenlive

    # UI stuff
    swaylock
    swaybg
    grim
    slurp
    wl-clipboard
    wl-mirror
    wlsunset

    # Files
    fzf
    ripgrep
    zip
    unzip
    file
    findutils
    jq

    # Security
    gnupg
    openssl

    # CLI - Fun
    neofetch

    # Programming - <Insert Nausea Emoji>
    (pkgs.python311.withPackages (python-pkgs: [
      #python-pkgs.pip
      python-pkgs.nltk
    ]))

  ];

}