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
      ./touchpad.nix
    ];

    type = "laptop";

    networking.hostName = "rbs";
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    users.users = {
      jan = {
        isNormalUser = true;
        description = "jan";
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
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
