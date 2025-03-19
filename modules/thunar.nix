{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.isHyprland {
  programs.xfconf.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
