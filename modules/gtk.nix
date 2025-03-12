{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      home.sessionVariables."GTK_THEME" = "Adwaita";
      home.packages = with pkgs; [
        adwaita-icon-theme
        gnome-themes-extra
      ];

      home.pointerCursor = {
        gtk.enable = true;
      };

      gtk = {
        enable = true;
        theme.name = "Adwaita";
        iconTheme.name = "Adwaita";

        font = {
          package = pkgs.cantarell-fonts;
          name = "Cantarell";
          size = 10 * config.scaleFactor;
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
