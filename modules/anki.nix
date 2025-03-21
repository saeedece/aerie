{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      home = {
        packages = [ pkgs.anki-bin ];
        sessionVariables."ANKI_WAYLAND" = 1;
      };
    }
  ];
}
