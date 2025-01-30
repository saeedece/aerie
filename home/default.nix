{ pkgs, ... }:
{
  imports = [
    ./modules/bash.nix
    ./modules/bat.nix
    ./modules/btop.nix
    ./modules/direnv.nix
    ./modules/firefox.nix
    ./modules/git.nix
    ./modules/helix.nix
    ./modules/jujutsu.nix
    ./modules/starship.nix
    ./modules/zsh.nix
  ];

  fonts.fontconfig.enable = true;
  home = {
    packages = with pkgs; [
      cachix
      evince
      fastfetch
      fd
      fzf
      keepassxc
      grim
      nil
      nixfmt-rfc-style
      noto-fonts
      noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
      markdown-oxide
      pinentry-curses
      ripgrep
      tree
      typst
      typstyle
      tinymist
    ];

    sessionVariables = {
      EDITOR = "hx";
      NIXOS_OZONE_WL = "1";
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };

  manual.manpages.enable = true;
  services.mpris-proxy.enable = true;
  systemd.user.startServices = "sd-switch";

  xdg = {
    enable = true;
    mime.enable = pkgs.stdenv.isLinux;
  };
}
