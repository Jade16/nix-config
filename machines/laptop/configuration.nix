{ lib, config, pkgs, ... }:

{
  imports = [
    #../../modules/modules.nix 
    ../../modules/config/systems/bluetooth/default.nix
    #./hardware-configuration.nix
  ];

  system.stateVersion = "23.05"; # NAO MUDAR!
  home.stateVersion = "24.11"; 

  #tools = {
    #development.git.enable = true;
    #terminal = {
      #terminal.enable = true;
      #kitty.enable = true;
      #nvim.enable = true;
      #zsh.enable = true; 
    #};
  #};
  #programs.zsh.enable = true;
   

  #hardware = {
    #keyboard.br-abnt2.enable = true;
    #printer = {
      #enable = true;
      #deskjet.enable = true; # Assumindo que você quer a impressora deskjet
    #};
    #scanner.enable = false;
    # CORRIGIDO: Usando o módulo de gráficos Intel que criamos
    #screen.enable = true;
  #};

  #systems = {
    #audio.pipewire.enable = true;
    #bluetooth.enable = true;
    #boot = {
      # CORRIGIDO: Caminho completo da opção e valor
      #efi.mount-point = "/boot";
      
      # CORRIGIDO: Escolhendo apenas UM bootloader
      #grub.enable = true;
      #enable = false; # Desativa o módulo do systemd-boot
    #};
    #desktop = {
      #autologin.enable = false;
      #hyprland.enable = false;
      #plasma6.enable = false;
      #rofi.enable = true;
      #services-user = {
        #cliphist.enable = true;
        #dunst.enable = true;
        #wlsunset.enable = true;
      #};
      #sway.enable = true;
      #waybar.enable = true;
    #};
    #font.nerd-font.enable = true;
    #kernel.zen.enable = true;
    #localization.brazil.enable = true;
    #network = {
      #enable = true; # CORRIGIDO: 'default' -> 'main'
      #vpn.enable = true;
      # Configuração do firewall (exemplo)
      #firewall = {
        #enable = true;
        #tcp-ports = [ 8080 ]; # Apenas um exemplo, configure como quiser
      #};
    #};
    #nix = {
      #trust.all = false;
      #github-api-path = config.age.secrets.github-api.path;
    #};
    #power = {
      #sleep.disable = true;
      #management.enable = true;
    #};
    #services = {
      #docker.enable = true;
      #packages = {
        # CORRIGIDO: Caminho da opção de overlays
        #overlays.enable = true; 
        #browser = {
          #zenbrowser.enable = true;
        #};
      #};
    #};
  #};

  home-manager = {
    # Configurações globais da integração
    useGlobalPkgs = true;
    useUserPackages = true;

    # A linha mais importante de todas:
    # Diz ao NixOS para usar o arquivo 'home.nix' para configurar o usuário 'jade'
    #users.jade = import ../../../home/systems/users/default.nix;
    #users.jade = import ../../modules/config/systems/bluetooth/default.nix;
  }; 
}
