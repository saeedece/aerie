{ config, lib, ... }:
{
  home-manager.sharedModules = [
    {
      programs.fuzzel = {
        enable = true;
        settings = {
          colors.background = "f2f2f2ff";
          colors.selection = "ccdfffff";
          main.font = "JetBrainsMono Nerd Font Mono";
        };
      };
    }
  ];
}
