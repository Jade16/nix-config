{ pkgs, ... }:
# configuracao do usuario
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
      "docker"
    ];
    shell = pkgs.zsh;
  };
}
