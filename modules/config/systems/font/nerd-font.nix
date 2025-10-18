{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.font.nerd-font;
in
{
  options = {
    systems.font.nerd-font = {
      enable = mkEnableOption "Adds nerd font"; 
    };
  };

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.go-mono 
    ];
  };
}
