{ config, lib, ... }:
{
  home-manager.sharedModules = [
    {
      services.hypridle = lib.mkIf config.isLaptop {
        enable = true;
      };
    }
  ];
}
