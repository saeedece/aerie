{
  config,
  inputs,
  name,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  config = {
    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      users.jan =
        inputs.self.internal.homeManagerConfigurations."${lib.strings.concatStrings [
          "jan"
          (lib.strings.toUpper name)
        ]}";
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
      users.jan = {
        isNormalUser = true;
        description = "jan";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
      };
    };
  };
}
