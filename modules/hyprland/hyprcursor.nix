{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      home.pointerCursor = {
        name = "Vanilla-DMZ";
        package = pkgs.vanilla-dmz;
        hyprcursor = {
          enable = true;
          size = lib.round (config.scaleFactor * 20);
        };
      };
    }
  ];
}
