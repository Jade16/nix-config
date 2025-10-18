# Exemplo de como o módulo poderia ser ainda mais flexível (NÃO PRECISA MUDAR NADA AGORA)
{ config, lib, pkgs, ... }: # <--- A LINHA MÁGICA QUE ESTAVA FALTANDO

{

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
