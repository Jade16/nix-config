{ config, lib, ... }:

{
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
