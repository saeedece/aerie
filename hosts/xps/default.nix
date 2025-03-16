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
      ./bootloaderPatch.nix
    ];

    type = "desktop";

    networking.hostName = "xps";
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

    system.stateVersion = "23.11";
    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = false;
      users = {
        jan = { };
      };
      sharedModules = [
        {
          home.stateVersion = "23.11";
        }
      ];
    };
  }
)
