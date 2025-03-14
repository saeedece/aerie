lib:
lib.nixosSystem (
  {
    config,
    lib,
    pkgs,
    ...
  }:
  {
    imports = [
      ./hardware.nix
      ./prime.nix
      ./battery.nix
      ./touchpad.nix
    ];

    scaleFactor = 0.9;
    type = "laptop";

    networking.hostName = "rbs";
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    users.users = {
      jan = {
        isNormalUser = true;
        description = "jan";
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
      };
    };

    system.stateVersion = "24.05";
    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = false;
      users = {
        jan = { };
      };
      sharedModules = [
        {
          home.stateVersion = "24.05";
        }
      ];
    };
  }
)
