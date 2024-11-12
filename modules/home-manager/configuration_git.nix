{
  config,
  lib,
  pkgs,
  ...
}: {    

  # Git
  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "jade16";
        email = "jade_bortot_paiva@usp.br";
      };
      init = {defaultBranch = "main";};
    };
  };

  # Gpg agent
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
    defaultCacheTtl = 600;

    enableSshSupport = true;
    defaultCacheTtlSsh = 600;
  };
}