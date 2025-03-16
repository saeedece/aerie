{ config, lib, ... }:
{
  home-manager.sharedModules = [
    {
      programs.bemenu = {
        enable = true;
      };
    }
  ];
}
