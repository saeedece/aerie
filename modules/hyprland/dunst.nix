{ config, lib, ... }:
{
  home-manager.sharedModules = [
    {
      services.dunst = {
        enable = true;
        settings = {
          global = {
            enable_posix_regex = true;
            font = "JetBrainsMono Nerd Font Mono 10.25";
            word_wrap = "yes";
            geometry = "0x0-62-62";
            padding = 2;
            seperator_height = 4;
            frame_width = 2;
          };
          urgency_low = {
            foreground = "#000000";
            background = "#f2f2f2";
            frame_color = "#000000";
            timeout = 4;
          };
          urgency_normal = {
            foreground = "#000000";
            background = "#f2f2f2";
            frame_color = "#000000";
            timeout = 4;
          };
          urgency_critical = {
            foreground = "#000000";
            background = "#ffffff";
            frame_color = "#000000";
          };
        };
      };
    }
  ];
}
