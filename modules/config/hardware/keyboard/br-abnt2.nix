{ config, lib, pkgs, ... }:

{
  # Aplica o layout ABNT2 diretamente
  console.keyMap = "br-abnt2";

  # Layout gráfico (para X11/Wayland)
  services.xserver = {
    layout = "br";
    xkbVariant = "abnt2";
  }; 
}

