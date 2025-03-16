{ config, lib, ... }:
lib.mkIf config.isDesktop {
  home-manager.sharedModules = [
    {
      programs.bemenu = {
        enable = true;
      };
    }
  ];
}
