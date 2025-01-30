{
  ...
}:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        enable_posix_regex = true;
        font = "JetBrainsMono Nerd Font Mono 10.25";
        word_wrap = "yes";
        geometry = "0x0-62-62";
        seperator_height = 2;
        padding = 2;
        horizontal_padding = 2;
        frame_width = 2;
        markup = "full";
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
