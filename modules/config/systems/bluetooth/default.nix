{
  config,
  lib,
  pkgs,
  ...
}:

{   
  config = lib.mkIf cfg.enable {
    
    services.blueman.enable = true;       # interface gráfica para Bluetooth
    services.bluetooth.enable = true;     # serviço principal
    services.bluetooth.powerOnBoot = true; # ligar o Bluetooth no boot
  };
}
