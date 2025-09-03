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
    pinentryPackage = pkgs.pinentry-gtk2; 
    defaultCacheTtl = 600;

    enableSshSupport = true;
    defaultCacheTtlSsh = 600;
  };
}
