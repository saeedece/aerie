{
  config,
  lib,
  ...
}:
{
  home-manager.sharedModules = [
    {
      programs.firefox = {
        enable = true;
        policies = {
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DontCheckDefaultBrowser = true;
          DisableFeedbackCommands = true;
          DisableFormHistory = true;
        };
      };
    }
  ];
}
