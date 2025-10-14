# modules/security/gpg.nix

{ pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
    defaultCacheTtl = 600;
    enableSshSupport = true;
    defaultCacheTtlSsh = 600;
  };
}
