# modules/home/desktop/hyprland-home.nix

{ config, pkgs, ... }:
# modulo do Home Manager para Hyprland
{
  # Pacotes de usuário específicos para o ambiente Hyprland
  home.packages = with pkgs; [
    swww
    grimblast # ferramenta de screenshot baseada no grim 
  ];

  # Configuração do cursor
  home.pointerCursor = {
    enable = true;
    hyprcursor.enable = true;
    hyprcursor.size = 32;
    package = pkgs.graphite-cursors;
    name = "graphite-dark-nord";
  };

  # Configurações do Hyprland via Home Manager
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      input = {
        kb_layout = "br";
        kb_variant = "abnt2";
      };
      exec-once = [
        "waybar"
        "swww-daemon"
      ];
      exec = [
        "swww img ${./../wallpapers/flores.jpeg}"
      ];
      # aparencia
      "general:gaps_out" = "2"; # espaco entre janelas e bordas
      "general:gaps_in" = "2"; # espaco entre janelas 
      "decoration:rounding" = "2"; # cantos arredondados 
      monitor = [ # configuracao de monitor 
        # configuracao especifica para monitor DP-2 com alta taxa de atualizacao, Mirroring (espelhamento) habilitado, highrr: taxa de atualizacao alta 
        ",highrr,auto,1,mirror,DP-2" 
        "DP-2,highrr,auto,1"
      ];
      "xwayland:force_zero_scaling" = "true"; # corrige escalonamento para apps X11
      cursor = {
        no_hardware_cursors = true; # usa cursores software
      };
      env = [ # variaveis de ambiente 
        "GDK_SCALE,1"
        "XCURSOR_SIZE,16"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
      # ATALHOS DE TECLADO 
      bindr = [ "SUPER, SUPER_L, exec, pkill waybar || waybar" ];
      binde = [ # teclas de midia 
        ", XF86AudioRaiseVolume, exec, sh ${./scripts/pips-volume-selector.sh} raise" # volume +
        ", XF86AudioLowerVolume, exec, sh ${./scripts/pips-volume-selector.sh} lower" # volume -
        ", XF86AudioMute, exec, sh ${./scripts/pips-volume-selector.sh} mute" # mute 
      ];
      bindm = [ # mouse 
        "$mod, mouse:272, movewindow" # mover janela 
        "$mod, mouse:273, resizewindow" # redimensionar janela 
      ];
      bind = [
        "$mod, left, movefocus, l" # mover foco entre janelas 
        "$mod, right, movefocus, r" # mover foco entre janelas 
        "$mod, up, movefocus, u" # mover foco entre janelas 
        "$mod, down, movefocus, d" # mover foco entre janelas 
        "$mod, C, killactive," # fechar janela aberta
        "$mod, V, togglefloating," # alterar modo flutuante 
        "$mod, F, exec, firefox" # abrir firefox 
        "$mod, K, exec, kitty" # abrir terminal 
        "$mod, Space, exec, rofi -show combi -modes combi -combi-modes 'window,drun,run'" # abrir Rofi (launcher) 
        ", Print, exec, grimblast copy output" # 
        "$mod, P, exec, grimblast copy output" # screenshot da tela inteira
        "$mod ALT, P, exec, grimblast copy area" # screenshot da area selecionada
        
        "$mod, Return, exec, kitty" 
        "$mod, D, exec, rofi -show drun" # rofi (apenas aplicativos)
        "$mod, Q, killactive," # fechar janelas 
        "$mod, M, exit," # sair do hyprland 
        "$mod SHIFT, R, exec, hyprctl reload" # recarregar configuracao 
      ]
      ++ (
        builtins.concatLists (
          builtins.genList (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mod, ${ws}, workspace, ${toString (x + 1)}" # mudar para workspace
              "$mod, ${ws}, exec, swww img ${./../wallpapers}/rw-region-${toString (x + 1)}.png --transition-type right --transition-duration 0 --transition-step 255"  
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}" # mudar janela de workspace 
              "$mod SHIFT, ${ws}, exec, swww img ${./../wallpapers}/rw-region-${toString (x + 1)}.png --transition-type right --transition-duration 0 --transition-step 255"
            ]
          ) 10
        )
      );
    };
  };
}
