{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.isHyprland {
  home-manager.sharedModules = [
    {
      home.pointerCursor = {
        enable = true;
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ";
        size = 18;
        gtk.enable = true;
      };
    }
  ];
}
