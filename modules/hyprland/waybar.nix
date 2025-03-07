{ config, lib, ... }:
{
  home-manager.sharedModules = [
    {
      programs.waybar = {
        enable = true;
        settings = [
          {
            layer = "top";
            position = "bottom";
            gtk-layer-shell = true;
            modules-left = [ "hyprland/workspaces" ];
            modules-center = [ "hyprland/window" ];
            modules-right = [
              "clock"
              "tray"
            ];
            clock = {
              tooltip = false;
              format = "{:%a %m/%d/%y %H:%M}";
            };
            tray = {
              tooltip = false;
              spacing = 10;
            };
          }
        ];
        style = builtins.readFile ./waybar.css;
      };
    }
  ];
}
