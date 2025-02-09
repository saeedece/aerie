{ ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      osd-font = "JetBrainsMono Nerd Font Mono";
      osd-font-size = "16";
      keep-open = "yes";
    };
  };
}
