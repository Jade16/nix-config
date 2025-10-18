{ pkgs, ... }:

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
}
