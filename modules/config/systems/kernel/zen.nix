{  config, lib, pkgs, ... }:
# configuracao do kernel 
{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  #boot.kernelModules = lib.mkForce [ "iwlwifi" ]; #carrega apenas o modulo do driver Wi-Fi da Intel

  # Exemplo de módulos mínimos para um sistema funcional:
  #boot.initrd.kernelModules = [
    #"xhci_pci"       # USB 3.0
    #"nvme"           # SSD NVMe
    #"usb_storage"
    #"sd_mod"         # Disco
    #"ext4"           # Sistema de arquivos
  #]; 
  boot.initrd.kernelModules = [
    "nvme"
    "xhci_pci"
    "usb_storage"
    "sd_mod"
  ];

  boot.kernelModules = [
    "iwlwifi"
    "kvm-intel"
  ];
}
