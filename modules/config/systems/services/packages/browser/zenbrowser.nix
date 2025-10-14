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
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        # Descrição corrigida
        description = "Enables the Zen Browser through Home Manager.";
      };
    };
  };


}
