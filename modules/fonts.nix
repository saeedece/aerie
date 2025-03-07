{
  config,
  lib,
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
  ];
}
