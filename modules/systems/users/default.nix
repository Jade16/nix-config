{ pkgs, ... }:

{
  # --- Parte do NixOS: "Construindo o Apartamento" ---
  users.users.jade = {
    isNormalUser = true;
    home = "/home/jade";
    description = "Jade";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "libvirtd"
      "wireshark"
    ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.jade = {
      home = {
        username = "jade";
        homeDirectory = "/home/jade";
        stateVersion = "25.05";
        sessionPath = [
          "$HOME/.local/bin"
        ];
        sessionVariables = {
          EDITOR = "nvim";
          GTK_THEME = "Adwaita:dark";
        };

      }; 
      systemd.user.startServices = "sd-switch";
      xdg.enable = true;   
    };
  };
}
