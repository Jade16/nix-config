{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.systems.services.packages.browser.zenbrowser;
in
{
  options = {
    # O caminho da opção está um pouco longo e inconsistente, vamos simplificar
    programs.zenbrowser = {
      enable = mkEnableOption "Enables the Zen Browser through Home Manager.";
    };
  };


}
