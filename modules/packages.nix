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
      claude-code
      curl
      discord
      drawio
      fastfetch
      fd
      foliate
      fzf
      gh
      kdePackages.kolourpaint
      kdePackages.okular
      keepassxc
      mold
      mpv
      obsidian
      pinentry-curses
      ripgrep
      rsync
      tree
      uv
    ]
    ++ lib.optionals config.isHyprland [
      pavucontrol
      xfce.ristretto
    ];
}
