{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.services.packages.browser.zenbrowser;
in
{
  options = {
    systems.services.packages.browser.zenbrowser = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables Intel graphics  
        '';
      };
      open = mkOption {
        default = true;
        type = types.bool;
        description = ''
           
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      inputs.zen-browser.packages.${pkgs.system}.default 
    ]; 
  };
}
