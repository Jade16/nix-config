# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    #../../modules/modules.nix
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "jade-nixos"; # Define your hostname.
    networkmanager.enable = true;
  };

  system.stateVersion = "23.05"; # NAO MUDAR!

  tools = {
    development = {
      git.enable = true;
    };
    terminal = {
      enable = true;
      kitty = {
        enable = true;
      };
      nvim = {
        enable = true;
      };
      zsh = {
        zsh.enable = true;
      };
    };
  };

  hardware = {
    keyboard = {
      br-abnt2.enable = true;
    };
    printer = {
      enable = true;
    };
    scanner = {
      enable = false;
    };
    screen = {
      enable = true;
    };
  };

  systems = {
    audio = {
      pipewire.enable = true;
    };
    bluetooth = {
      enable = true;
    };
    boot = {
      efi.mount-point = "/boot";
      grub.enable = true;
      enable = true;
    };
    desktop = {
      autologin = {
        enable = false;
      };
      hyprland = {
        enable = false;
      };
      plasma6 = {
        enable = false;
      };
      rofi = {
        enable = true;
      };
      services-user = {
        cliphist = {
          enable = true;
        };
        dunst = {
          enable = true;
        };
        wlsunset = {
          enable = true;
        };
      };
      sway = {
       enable = true;
      };
      waybar = {
        enable = true;
      };
    };

    font = {
      nerd-font.enable = true;
    };
    kernel = {
      zen.enable = true;
    };
    localization = {
      brazil.enable = true;
    };
    network = {
      enable = true;
      vpn.enable = true;
    };
    nix = {
      trust.all = false;
      github-api-path = config.age.secrets.github-api.path;
    };
    power = {
      sleep.disable = true;
      management.enable = true;
    };
    services = {
      docker.enable = true;
      packages = {
        zenbrowser.enable = true; 
        #enable = true;
        overlays = {
          enable = false;
        };
      };
    };
  };
}
