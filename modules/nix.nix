{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  nix.channel.enable = false;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    persistent = true;
  };
  nix.nixPath = [ "nixpkgs=/etc/nixpkgs" ];
  nix.optimise.automatic = true;

  nix.settings.substituters = [
    "https://cuda-maintainers.cachix.org"
    "https://nix-community.cachix.org"
    "https://hyprland.cachix.org"
    "https://ghostty.cachix.org/"
  ];

  nix.settings.trusted-public-keys = [
    "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  environment.etc.nixpkgs.source = inputs.nixpkgs;
  environment.systemPackages = with pkgs; [
    nh
    nix-index
    nix-output-monitor
  ];

  home-manager.sharedModules = [
    {
      home.sessionVariables.NIXPKGS_ALLOW_UNFREE = 1;
    }
  ];
}
