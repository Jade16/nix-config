# Exemplo de como o módulo poderia ser ainda mais flexível (NÃO PRECISA MUDAR NADA AGORA)
{ config, lib, pkgs, ... }: # <--- A LINHA MÁGICA QUE ESTAVA FALTANDO

with lib;
let
  cfg = config.systems.desktop.autologin;
in
{
  options.systems.desktop.autologin = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enables autologin using greetd.";
    };
    user = mkOption {         # <--- Nova opção para o nome de usuário
      type = types.str;
      default = "jade";        # <--- O padrão continua sendo "jade"
      description = "User to automatically log in.";
    };
  };

  config = mkIf cfg.enable {
    services.greetd = {
      # ...
      settings.initial_session = {
        command = ''${pkgs.zsh}/bin/zsh -c "${pkgs.sway}/bin/sway"'';
        user = cfg.user;       # <--- Usando a nova opção aqui
      };
      # ...
    };
  };
}
