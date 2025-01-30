{
  ...
}:
{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar.css;
    settings = [
      {
        layer = "top";
        position = "bottom";
        height = 4;
        "gtk-layer-shell" = true;
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
  };
}
