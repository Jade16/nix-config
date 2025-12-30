{ config, lib, pkgs, ... }:
# configuracao das notificacoes do sistema
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font 10";
        frame_width = 2;
        separator_height = 2;
        corner_radius = 8;
        transparency = 10;
        follow = "keyboard";
      };
      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#89b4fa";
      };
      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#a6e3a1";
      };
      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#f38ba8";
        frame_color = "#f38ba8";
      };
    };
  };
}

