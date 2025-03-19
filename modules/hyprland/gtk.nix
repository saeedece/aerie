{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.isHyprland {
  home-manager.sharedModules = [
    {
      home = {
        sessionVariables."GTK_THEME" = "Adwaita";
        packages = with pkgs; [
          adwaita-icon-theme
          gnome-themes-extra
        ];
      };
      gtk = {
        enable = true;
        theme.name = "Adwaita";
        font = {
          package = pkgs.cantarell-fonts;
          name = "Cantarell";
          size = 10;
        };
        gtk3.extraConfig = {
          gtk-application-prefer-dark-theme = false;
        };
        gtk4.extraConfig = {
          gtk-application-prefer-dark-theme = false;
        };
      };
    }
  ];
}
