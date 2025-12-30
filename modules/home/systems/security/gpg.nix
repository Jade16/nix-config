# modules/security/gpg.nix
{ pkgs, ... }:
# configuracao do GPG com suporte a SSH
{
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
    defaultCacheTtl = 600;
    enableSshSupport = true;
    defaultCacheTtlSsh = 600;
  };
}
