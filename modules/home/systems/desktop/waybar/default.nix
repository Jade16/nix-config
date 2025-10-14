{ config, lib, pkgs, ... }:

lib.mkIf config.systems.desktop.waybar.enable {

  # Ativa e configura o Waybar (NÃO o i3status)
  programs.waybar = {
    enable = true;
    # A configuração do Waybar é diferente. Usamos um 'attrset' que vira JSON.
    settings = {
      mainBar = {
        # A ordem dos módulos aqui define a ordem na barra
        modules-left = [ "custom/logo" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "battery" "pulseaudio" "cpu" "memory" ];
        
        # Exemplo de como traduzir suas configurações:
        clock = {
          format = "{:%d/%m/%Y %H:%M}"; # Formato do relógio
        };

        network = {
          format-wifi = "NET: {essid} ({signalStrength}%)";
          format-down = "NET: down";
        };

        battery = {
          format = "BAT: {capacity}% {icon}";
          format-charging = "BAT: {capacity}% ⚡";
          format-plugged = "BAT: {capacity}% 🔌";
          format-icons = ["" "" "" "" ""];
        };
        
        pulseaudio = {
            format = "VOL: {volume}% {icon}";
            format-muted = "VOL: muted";
            format-icons = {
                default = ["" "" ""];
            };
        };

        cpu = {
          format = "CPU: {usage}%";
        };

        memory = {
          format = "MEM: {}%";
        };
        
        # Módulo customizado para o logo
        "custom/logo" = {
          format = "  "; # Ícone do NixOS
        };
      };
    };

    # Você também pode adicionar um CSS customizado para o estilo
    style = import ./style.css; 
  };
}
