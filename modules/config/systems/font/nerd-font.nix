{
  config,
  lib,
  pkgs,
  ...
}:


{

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.go-mono 
    ];
  };
}
