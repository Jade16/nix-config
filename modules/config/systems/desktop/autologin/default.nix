# Exemplo de como o módulo poderia ser ainda mais flexível (NÃO PRECISA MUDAR NADA AGORA)
let
  cfg = config.systems.desktop.autologin;
in
{
  options.systems.desktop.autologin = {
    enable = mkOption { ... };
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
        command = ...;
        user = cfg.user;       # <--- Usando a nova opção aqui
      };
      # ...
    };
  };
}
