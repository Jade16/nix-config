{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:{
  
  # Packages
  home.packages = with pkgs; [
    # browsers
    brave
    #inputs.zen-browser.packages.${pkgs.system}.specific
      
    # pacotes para o bootloader (?)
    os-prober
    ntfs3g

    # Pomodoro
    #tomato-c

    # terminal
    kitty

    # editor
    #sublime

    # git
    git

    # make
    #gnumake

    # gcc
    #gnat

    # debuger
    #gdb
    
    # video
    #stremio

    # leitor pdf
    #libsForQt5.okular
    #sioyek
    #zotero 

    # editor imagens
    #inkscape-with-extensions
    #gimp-with-plugins

    # editor de video
    #libsForQt5.kdenlive

    # UI stuff
    swaylock
    swaybg
    grim
    slurp
    wl-clipboard
    wl-mirror
    wlsunset

    # VPN
    #openconnect

    # SQL Developer
    #sqlcl # SQL Developer Command Line
    #sqldeveloper # SQL Developer

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

    # VM
    #virtualbox

    # Programming - <Insert Nausea Emoji>
    #(pkgs.python311.withPackages (python-pkgs: [
      #python-pkgs.pip
      #python-pkgs.nltk
    #]))

    # CUDA
   #cudaPackages.nccl  
  ];
}
