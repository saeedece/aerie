{
  pkgs,
  ...
}:
{
  imports = [
    ./modules/ghostty.nix
  ];

  aerie.ghostty = {
    fontSize = 11.25;
    windowDec = true;
  };

  home = {
    packages = [ pkgs.adwaita-icon-theme ];
    stateVersion = "24.05";
  };
}
