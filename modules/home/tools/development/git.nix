{ config, lib, ... }:

lib.mkIf config.tools.development.git.enable {

  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "Jade";
        email = "jade_bortot_paiva@usp.br";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

}
