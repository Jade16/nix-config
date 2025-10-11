{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.desktop.dunst;
in
{
  options = {
    systems.desktop.dunst = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables dunst 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.jade = {
        #imports = [
          #../home-manager/home.nix
          #inputs.nixvim.homeManagerModules.nixvim
        #];
        services.dunst = {
          enable = true;
          settings.global = {
            font = "GoMono Nerd Font Mono 16";
          };
        }; 
      }; 
    };
  };
}
