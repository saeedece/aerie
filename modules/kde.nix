{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.isKde {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.settings.General.DisplayServer = "wayland";

  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    konsole
    plasma-browser-integration
  ];
}
