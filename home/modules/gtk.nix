{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme.name = "Adwaita";
    iconTheme.name = "Adwaita";
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
