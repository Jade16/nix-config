# aqui estao as configuracoes/personalizacoes do window manager
{
  config,
  lib,
  pkgs,
  ...
}: {

  xdg.configFile."sway-lock.png".source = ./res/lock.png;
  xdg.configFile."sway-bg.png".source = ./res/bg.png;

  wayland.windowManager.sway = let
    green = "#a6e3a1";
    blue = "#89b4fa";
    text = "#cdd6f4";
    surface1 = "#45475a";
    base = "#1e1e2e";
    lock-img = "${config.xdg.configHome}/sway-lock.png";
    bg-img = "${config.xdg.configHome}/sway-bg.png";
  in {
    enable = true;
    checkConfig = false;

    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      defaultWorkspace = "workspace number 1";

      bars = [
        {
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = {
            names = ["GoMono Nerd Font"];
            size = 12.0;
          };

          colors = {
            background = base;
            statusline = text;
            focusedStatusline = text;
            focusedSeparator = base;
            focusedWorkspace = {
              background = base;
              border = base;
              text = green;
            };
            activeWorkspace = {
              background = base;
              border = base;
              text = blue;
            };
            inactiveWorkspace = {
              background = base;
              border = base;
              text = surface1;
            };
            urgentWorkspace = {
              background = base;
              border = base;
              text = surface1;
            };
            bindingMode = {
              background = base;
              border = base;
              text = surface1;
            };
          };
        }
      ];

      keybindings = let
        lightScript = pkgs.writeScriptBin "light-script.sh" ''
          #!/usr/bin/env sh

          l=$(light -G)
          f=1.2

          if [[ $1 = "up" ]]; then
            l=$(echo "$l $f" | awk '{print($1 * $2)}')
          else
            l=$(echo "$l $f" | awk '{print($1 / $2)}')
          fi

          light -S $l
        '';
      in
        lib.mkOptionDefault {
          "XF86AudioMute" = ''
            exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
          '';

          "XF86AudioRaiseVolume" = ''
            exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && \
            wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
          '';

          "XF86AudioLowerVolume" = ''
            exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && \
            wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
          '';

          "XF86AudioMicMute" = ''
            exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle &&              \
            dunstify -t 2000 $(                                               \
              wpctl get-volume @DEFAULT_AUDIO_SOURCE@ |                       \
              awk '{if($3) {print("mic muted")} else {print("mic working")}}' \
            )
          '';

          "XF86MonBrightnessUp" = "exec ${lightScript}/bin/light-script.sh up";

          "XF86MonBrightnessDown" = "exec ${lightScript}/bin/light-script.sh down";

          "Mod4+shift+s" = ''
            exec grim -g "$(slurp)" - | wl-copy --type image/png
          '';

          "Mod4+x" = ''
            exec swaylock -f --image ${lock-img} \
              --indicator-idle-visible &&        \
            systemctl suspend
          '';

          "Mod4+Shift+x" = ''
            exec swaylock -f --image ${lock-img} \
              --indicator-idle-visible
          '';
        };
    };

    extraConfig = let
      lowBatteryScript = pkgs.writeScriptBin "low-battery.sh" ''
        #!/usr/bin/env sh
        while true
        do
          if [[ $(cat /sys/class/power_supply/BAT1/capacity) -le 10 ]] && \
             [[ $(cat /sys/class/power_supply/BAT1/status) = "Discharging" ]]
          then
            dunstify -u critical "Low Battery"
          fi
          sleep 30
        done
      '';
    in ''
      input * {
        xkb_layout "br"
        dwt false
      }

      input type:touchpad {
        tap enabled
        natural_scroll enabled
      }

      default_border none
      output "*" bg ${bg-img} fill

      exec ${lowBatteryScript}/bin/low-battery.sh
    '';
  };
}
