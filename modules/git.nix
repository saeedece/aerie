{
  config,
  lib,
  ...
}:
{
  programs.git.enable = true;
  home-manager.sharedModules = [
    {
      programs.git = {
        enable = true;
        userName = "saeed";
        userEmail = "git@saeedc.com";
        extraConfig.init.defaultBranch = "main";
      };
    }
  ];
}
