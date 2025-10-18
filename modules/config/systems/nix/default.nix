{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    nix.settings.trusted-users =
      if cfg.trust.all then builtins.attrnames config.users.users else cfg.trust.users;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
