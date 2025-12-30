# modules/home/core/packages.nix

{ pkgs, inputs, ... }:
# configuracao de pacotes
{
  home.packages = with pkgs; [
    # Navegadores
    brave
    # Descomente se quiser usar o zen-browser, que já está no seu flake
    # inputs.zen-browser.packages.${pkgs.system}.default

    # Google Drive
    grive2

    # Produtividade
    tomato-c # Pomodoro

    # Editores
    sublime

    # Mídia
    stremio
    libsForQt5.okular
    sioyek
    zotero
    inkscape-with-extensions
    gimp-with-plugins
    libsForQt5.kdenlive

    # SQL
    sqlcl
    # sqldeveloper

    # CLI Fun
    neofetch

    # Ambiente Python com pacotes
    (python311.withPackages (python-pkgs: [
      #python-pkgs.pip
      python-pkgs.nltk
    ]))
  ];
}
