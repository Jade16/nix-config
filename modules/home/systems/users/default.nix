{ 
  ... 
}:

{
  home = {
    username = "jade";
    homeDirectory = "/home/jade";
    stateVersion = "25.05";
  };

  xdg.enable = true;

  imports = (import ../../../modules-home.nix).imports;
}
