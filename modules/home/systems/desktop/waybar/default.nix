{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "pulseaudio" "battery" "tray" ];

        "clock" = {
          format = "{:%H:%M   %d/%m}";
        };
        "battery" = {
          format = "{capacity}% ";
          format-alt = "{time} {capacity}%";
        };
        "network" = {
          format-wifi = " {signalStrength}%";
          format-ethernet = "";
          format-disconnected = "󰖪";
        };
      };
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 11pt;
        border-radius: 8px;
        color: #cdd6f4;
      }

      window#waybar {
        background: rgba(30, 30, 46, 0.8);
        border: 1px solid #11111b;
        padding: 5px 10px;
      }

      #workspaces button.active {
        background-color: #89b4fa;
        color: #1e1e2e;
      }

      #clock, #battery, #network, #tray {
        padding: 0 10px;
      }
    '';
  };
}

