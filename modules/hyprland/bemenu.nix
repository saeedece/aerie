{ config, lib, ... }:
lib.mkIf config.isHyprland {
  home-manager.sharedModules = [
    {
      programs.bemenu = {
        enable = true;
        settings = {
          fn = "JetBrainsMono Nerd Font Mono 10";
          fb = "#0b0b0b";
          ff = "#ffffff";
          nb = "#0b0b0b";
          nf = "#ffffff";
          tb = "#0b0b0b";
          hb = "#0b0b0b";
          tf = "#b3a6d8";
          hf = "#b3a6d8";
          af = "#ffffff";
          ab = "#0b0b0b";
        };
      };
    }
  ];
}
