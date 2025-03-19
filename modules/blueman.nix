{ config, lib, ... }:
{
  services.blueman.enable = lib.mkIf config.isHyprland true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
