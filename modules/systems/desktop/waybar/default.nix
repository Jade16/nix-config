{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.desktop.waybar;
in
{
  options = {
    systems.desktop.waybar = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables waybar 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users.jade = {
      programs.i3status = {
        enable = true;
        enableDefault = false;

        modules = {
          "tztime local" = {
            enable = true;
            position = 0;
            settings = {format = "%d/%m/%Y %H:%M ";};
          };
          "wireless wlp0s20f3" = {
            enable = true;
            position = 1;
            settings = {
              format_up = " NET:%quality at %essid ";
              format_down = "NET: down";
            };
          };
          "battery 1" = {
            enable = true;
            position = 2;
            settings = {
              format = " BAT: %percentage %status ";
              format_down = " BAT: none ";
              status_chr = "charging";
              status_bat = "draining";
              status_unk = "unknown";
              status_full = "full";
              last_full_capacity = true;
              path = "/sys/class/power_supply/BAT%d/uevent";
              low_threshold = 20;
            };
          };
          "load" = {
            enable = true;
            position = 3;
            settings = {format = " LOAD: %1min ";};
          };
          "cpu_temperature 0" = {
            enable = true;
            position = 4;
            settings = {
              format = " TEMP: %degrees C ";
              path = "/sys/devices/platform/coretemp.0/hwmon/hwmon?/temp1_input";
            };
          };
          "memory" = {
            enable = true;
            position = 5;
            settings = {
              format = " MEM: %used ";
              threshold_degraded = "25%";
            };
          };
          "volume master" = {
            enable = true;
            position = 6;
            settings = {
              format = " VOL: %volume ";
              format_muted = " VOL: muted";
              device = "default";
              mixer = "Master";
              mixer_idx = 0;
            };
          };
        };
      };
    };
  };
}
