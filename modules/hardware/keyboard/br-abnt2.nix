{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.hardware.keyboard.br-abnt2;
in
{
  options = {
    hardware.keyboard.br-abnt2 = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables ABNT2 keyboard 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    console.keyMap = "br-abnt2"; 
    
    home-manager.users.jade = {
      # Clipboard manager - historico do ctrl c + d
      services.cliphist.enable = true; 
    };
  };
}
