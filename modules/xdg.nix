{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      xdg = {
        enable = true;
        mime.enable = pkgs.stdenv.isLinux;
      };
    }
  ];
}
