{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tools.development.git;
in
{
  options = {
    tools.development.git = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enables git 
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      extraConfig = {
        user = {
          name = "Jade";
          email = "jade_bortot_paiva@usp.br";
        };
        init = {defaultBranch = "main";};
      };
    };
    # Gpg agent
    services.gpg-agent = {
      enable = true;
      #pinentryPackage = pkgs.pinentry-qt;
      pinentry.package = pkgs.pinentry-gtk2; 
      defaultCacheTtl = 600;

      enableSshSupport = true;
      defaultCacheTtlSsh = 600;
    }; 
  };
}
