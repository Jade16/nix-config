{
  config,
  lib,
  pkgs,
  ...
}: {

  # formato das coisas que aparecem no terminal  

  # Shell
  xdg.configFile."zsh-custom/themes/lucasegp.zsh-theme".source =
    ../../extra-configs/lucasegp.zsh-theme;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    syntaxHighlighting.highlighters = ["line" "brackets" "main" "regexp"];

    autosuggestion.enable = true;

    shellAliases = {
      v = "nvim";
      c = "clear";
      k = "kubectl";
      clip = "cliphist list | fzf | cliphist decode | wl-copy";
    };

    oh-my-zsh = {
      enable = true;
      theme = "lucasegp";
      plugins = [
        "git"
        "docker"
        "aws"
        "docker"
        "docker-compose"
        "golang"
        "helm"
        "kubectl"
        "kubectx"
        "pass"
        "python"
        "rsync"
        "sudo"
        "systemd"
      ];
      custom = "${config.xdg.configHome}/zsh-custom";
    };

    #initExtra = ''
    initContent = ''
      fzcd() {
        dir_to_change=$(              \
          find $@                     \
            -path "*/.git*" -prune -o \
            -path "*/venv*" -prune -o \
            -print                    \
            2>/dev/null               \
          |fzf --reverse              \
        )

        if [[ -z "$dir_to_change" ]]; then
          return 0
        fi

        if [[ -d "$dir_to_change" ]]; then
          cd "$dir_to_change"
        else
          cd "$(dirname $dir_to_change)"
        fi
      }

      autoload -U compinit; compinit
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      source /home/jade/.extra-zsh-config.sh

      GPG_TTY=$(tty)
      export GPG_TTY

      eval "$(direnv hook zsh)"
    '';
  };


  # Tmux
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    prefix = "C-Space";
    mouse = true;
    newSession = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_default_text "#{?#{==:#{pane_current_command},zsh},#{b:pane_current_path},#{pane_current_command}}"
          set -g @catppuccin_window_current_text "#{?#{==:#{pane_current_command},zsh},#{b:pane_current_path},#{pane_current_command}}"
        '';
      }
      sensible
      yank
      vim-tmux-navigator
    ];

    extraConfig = ''
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind o send-keys "\003\012fzcd ~\012"
      bind i send-keys "\003\012clear\012"
      bind u send-keys "\003\012clip\012"

      set -g status-bg 'default'
      set-option -g status-style bg=default
      set-option -sa terminal-overrides ",xterm*:Tc"
      set-option -g renumber-windows on

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind-key a swap-window -t -1 \; select-window -t -1
      bind-key d swap-window -t +1 \; select-window -t +1

      bind ';' split-window -v -c "#{pane_current_path}"
      bind 'ç' split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };
}
