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
        enable = true;
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ";
        size = 18;
        gtk.enable = true;
        hyprcursor.enable = true;
        x11.enable = true;
      };
    }
  ];
}
