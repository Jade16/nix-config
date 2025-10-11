{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.boot.plymouth;
in
{
  options = {
    systems.boot.plymouth = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables plymouth 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot = {
          enable = false;
        }; 
      }; 
      #plymouth = {
        #enable = true;
        #theme = "pixels";
        #themePackages = with pkgs; [
          # By default we would install all themes
          #(adi1090x-plymouth-themes.override {
            #selected_themes = [ "pixels" ];
          #})
        #];
      #};

      #consoleLogLevel = 3;
      #initrd.verbose = false;

      kernelParams = [
        #"quiet"
        #"splash"
        #"boot.shell_on_fail"
        #"udev.log_priority=3"
        #"rd.systemd.show_status=auto"
        #"plymouth.use-simpledrm"
        "pci=nommconf"    # Resolve conflitos de configuração de memória PCI
        "pcie_aspm=off"   # Desativa ASPM se houver instabilidades
        "nvme_core.default_ps_max_latency_us=0"  # Otimiza performance NVMe 
      ];

      ### Hide OS Selection
      #loader.timeout = 0;
    };     
  };
}
