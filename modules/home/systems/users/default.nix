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

  imports = [ #importar apenas os arquivos de configuracao do home manager
    ../../../modules-home.nix  
  ];
}
