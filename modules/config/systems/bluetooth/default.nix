{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.bluetooth;
in
{
  #options = {
    #systems.bluetooth = {
      #enable = mkOption {
        #default = false;
        #type = types.bool;
        #description = ''
          #Enables bluetooth
        #'';
      #};
    #};
  
  options = {
    bluetooth = {
      enable = lib.mkEnableOption ''
        Enables bluetooth
      '';
    };
  };


  config = lib.mkIf cfg.enable {
    hardware = {
      bluetooth = {
        powerOnBoot = true;
        enable = true;
      };
    };
    services = {
      blueman = {
        enable = true;
      };
    };
  };
}
