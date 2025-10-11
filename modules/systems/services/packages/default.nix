{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager.users.jade = {
    # Packages
      home.packages = with pkgs; [
        # browsers
        brave
        #inputs.zen-browser.packages.${pkgs.system}.default 
      
        # pacotes para o bootloader (?)
        os-prober
        ntfs3g

        # Acesso remoto 
        anydesk

        # Cliente para Google Drive
        grive2 

        # Pomodoro
        tomato-c

        # terminal
        kitty
        wezterm 

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
        sioyek
        zotero 

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

        # VPN
        openconnect

        # SQL Developer
        sqlcl # SQL Developer Command Line
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
        virtualbox

        # Programming - <Insert Nausea Emoji>
        (pkgs.python311.withPackages (python-pkgs: [
          #python-pkgs.pip
          python-pkgs.nltk
        ]))

        # CUDA
      #cudaPackages.nccl  

      # Docker
      #docker_28 
    ];
  };
}
