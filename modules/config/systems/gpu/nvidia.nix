# modules/config/hardware/nvidia.nix (sugestão de nome)
{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    # CORREÇÃO: 'hardware.graphics.enable' foi trocado para 'hardware.opengl.enable'
    hardware.opengl.enable = true;

    hardware.nvidia.modesetting.enable = true;
    boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

    # Uso perfeito da sua opção customizada 'open'!
    hardware.nvidia.open = cfg.open;

    # Ponto de atenção: Usando drivers beta. Se quiser estabilidade, remova esta linha.
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
