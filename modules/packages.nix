{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      clang
      curl
      discord
      drawio
      fastfetch
      fd
      fzf
      keepassxc
      mold
      mpv
      obsidian
      pinentry-curses
      ripgrep
      rsync
      tree
    ]
    ++ lib.optionals config.isHyprland [
      kdePackages.okular
      pavucontrol
      xfce.ristretto
    ];
}
