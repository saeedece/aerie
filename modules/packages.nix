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
      fzf
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
      foliate
      kdePackages.okular
      pavucontrol
      xfce.ristretto
    ];
}
