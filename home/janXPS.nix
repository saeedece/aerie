{
  pkgs,
  ...
}:
{
  imports = [
    ./modules/hyprland
    ./modules/ghostty.nix
    ./modules/gtk.nix
  ];

  aerie.ghostty = {
    fontSize = 10.25;
    windowDec = false;
  };

  home = {
    stateVersion = "23.11";
    packages = with pkgs; [
      anki-bin
      adwaita-icon-theme
      discord
      drawio
      foliate
      gnome-themes-extra
      newsraft
      obs-studio
      xfce.ristretto
    ];

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.vanilla-dmz;
      name = "DMZ-White";
      size = 22;
    };

    sessionVariables."GTK_THEME" = "Adwaita";
    sessionVariables."ANKI_WAYLAND" = "1";
  };
}
