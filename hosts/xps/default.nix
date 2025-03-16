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

    scaleFactor = 1.0;
    type = "desktop";

    networking.hostName = "xps";
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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
