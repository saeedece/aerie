{
  lib,
  config,
  ...
}:
let
  cfg = config.aerie.ghostty;
in
{
  options.aerie.ghostty = {
    fontSize = lib.mkOption {
      type = lib.types.float;
      default = 10.25;
    };
    windowDec = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {
    programs.ghostty = {
      enable = true;
      settings = {
        font-family = "JetBrainsMono Nerd Font Mono";
        font-size = cfg.fontSize;
        shell-integration-features = "no-cursor";
        theme = "modus_operandi";
        window-theme = "ghostty";
        window-decoration = cfg.windowDec;
      };
      themes = {
        "modus_operandi" = {
          background = "#ffffff";
          cursor-color = "#000000";
          foreground = "#000000";
          palette = [
            "0=#000000"
            "1=#a60000"
            "2=#006800"
            "3=#6f5500"
            "4=#0031a9"
            "5=#721045"
            "6=#00538b"
            "7=#c4c4c4"
            "8=#585858"
            "9=#972500"
            "10=#316500"
            "11=#884900"
            "12=#354fcf"
            "13=#531ab6"
            "14=#005a5f"
            "15=#595959"
          ];
          selection-background = "#bcbcbc";
          selection-foreground = "#000000";
        };
      };
    };
  };
}
