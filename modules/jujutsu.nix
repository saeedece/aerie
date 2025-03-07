{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      programs.jujutsu = {
        enable = true;
        settings = {
          user.name = "saeed";
          user.email = "git@saeedc.com";
          ui.paginate = "never";
        };
      };
    }
  ];
}
