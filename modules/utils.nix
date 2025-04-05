{ config, lib, ... }:
{
  programs.command-not-found.enable = false;
  home-manager.sharedModules = [
    {
      manual.manpages.enable = true;
      services.mpris-proxy.enable = true;
      systemd.user.startServices = "sd-switch";
      home.sessionVariables."LD_LIBRARY_PATH" = "/run/opengl-driver/lib";
    }
  ];
}
