{ config, lib, ... }:
{
  home-manager.sharedModules = [
    {
      programs.bash = {
        enable = true;
        enableCompletion = true;
      };
    }
  ];
}
