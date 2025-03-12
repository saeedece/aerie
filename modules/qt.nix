{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      qt = {
        enable = true;
        style.package = pkgs.adwaita-qt;
      };
    }
  ];
}
