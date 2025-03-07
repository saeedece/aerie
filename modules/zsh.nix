{
  config,
  lib,
  ...
}:
{
  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  home-manager.sharedModules = [
    {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = false;
      };
    }
  ];
}
