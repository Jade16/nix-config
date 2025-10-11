{
  config,
  lib,
  pkgs,
  ...
}:
{
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
        sessionPath = ["$HOME/.local/bin"];
        sessionVariables = {
          EDITOR = "nvim";
          GTK_THEME = "Adwaita:dark";
        }; 
        stateVersion = "23.05"; 
      };
      #imports = [
        #../home-manager/home.nix
        #inputs.nixvim.homeManagerModules.nixvim
      #];
      systemd.user.startServices = "sd-switch"; 
    };
  };
}

