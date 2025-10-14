{ config, lib, pkgs, ... }:

# A configuração inteira está envolvida em um 'mkIf'.
# Ele só vai gerar este código se a opção for 'true'.
lib.mkIf config.systems.desktop.rofi.enable {

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    font = "FiraCode Nerd Font Mono 15";
    
    # Importante: Este caminho agora é relativo a ESTE novo arquivo.
    # Coloque seu 'theme.rasi' na mesma pasta que este 'rofi-home.nix'.
    theme = ./${./theme.rasi};
  };

}
