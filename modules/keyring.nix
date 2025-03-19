{ config, lib, ... }:
lib.mkIf config.isHyprland {
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
}
