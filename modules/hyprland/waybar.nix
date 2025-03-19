{ config, lib, ... }:
lib.mkIf config.isHyprland {
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
            modules-right = [ "clock" ] ++ (lib.optional config.isLaptop "battery") ++ [ "tray" ];
            clock = {
              tooltip = false;
              format = "{:%a %Y-%m-%d %H:%M}";
            };
            tray = {
              tooltip = false;
              spacing = 10;
            };
          }
        ];
        style = ''
          * {
            border: none;
            border-radius: 0;
            font-family: "JetBrainsMono Nerd Font Mono";
            font-size: 14px;
            min-height: 0;
          }

          window#waybar {
            background-color: rgba(11, 11, 11, 0.7);
            color: #ffffff;
          }

          #window {
            padding: 0 15px;
          }

          #workspaces button {
            padding: 3px 8px;
            background-color: transparent;
            border-bottom: 2px solid rgba(100, 114, 125, 0.5);
            color: #999999;
          }

          #workspaces button.focused {
            color: #ffffff;
            background-color: #444444;
            border-bottom: 2px solid #b3a6d8;
          }

          #workspaces button.urgent {
            background-color: #eb4d4b;
          }

          #battery,
          #clock,
          #tray {
            padding: 0 5px;
            margin: 0 4px;
            background-color: transparent;
            border-bottom: 2px solid #b3a6d8;
            color: #ffffff;
          }

          #tray menu {
            color: #000000;
          }
        '';
      };
    }
  ];
}
