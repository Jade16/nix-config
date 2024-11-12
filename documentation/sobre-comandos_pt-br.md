# Funções e objetivos desse documento
Nesse documento, o meu objetivo é listar os comando usados na minha configuração NixOS e explicar o que eles fazem.
Dessa forma, o objetivo desse documento é que seja possível buscar por um comando específico e entender o que ele faz.
Irei indicar de qual documento o comando está sendo usado e se necessário, em qual contexto ele é aplicado também.

# home-manager
## home.nix
- inputs -> parâmetro que representa uma coleção de entradas que a configuração precisa. Cada entrada pode apontar para um repositório de pacotes, um arquivo de configuração externa ou qualquer outro recurso externo necessário. Por exemplo, se você está trabalhando com um flake que depende de pacotes externos específicos.

- outputs -> Usado com flakes, define o que o sistema vai "produzir" a partir dos inputs. Outputs contém definições para o que será exportado do flake, como pacotes compilados, configurações ou módulos que você deseja disponibilizar. Esse parâmetro organiza as saídas em diferentes tipos, como defaultPackage, defaultApp, entre outros, que serão visíveis para o Nix quando ele processa o flake.

- lib -> Biblioteca padrão do Nix (nixpkgs.lib), que contém várias funções utilitárias para simplificar expressões Nix.

- config -> Representa as configurações do sistema. Quando é passado como parâmetro, permite acessar as configurações atuais e também modificar o comportamento de outros módulos.

- pkgs -> Esse parâmetro representa o conjunto de pacotes Nix, permitindo acesso direto aos pacotes disponíveis, como ferramentas, bibliotecas e aplicativos.

- ... -> As reticências permitem o uso de argumentos extras que podem ser passados sem serem explicitamente nomeados, conferindo flexibilidade adicional.

- imports = [ ]; -> Esse comando é usado para importar outros módulos Nix para a configuração. O nome dos arquivos e o caminho de onde ele está localizado são escritos detro das chaves [] e mais de um modulo pode ser separado por linha apenas.

-  