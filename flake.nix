{
  description = "jan NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    with inputs.nixpkgs.lib;
    let
      forEachSystem = genAttrs [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      pkgsBySystem = forEachSystem (
        system:
        import nixpkgs {
          inherit system;
          config = import ./nix/config.nix;
          overlays = self.internal.overlays."${system}";
        }
      );

      mkNixOsConfiguration =
        name:
        {
          system,
          host ? name,
        }:
        nameValuePair name (nixosSystem {
          inherit system;
          modules = [
            (
              { name, ... }:
              {
                networking.hostName = name;
              }
            )
            (
              { inputs, ... }:
              {
                # use nixpkgs from flake
                nixpkgs = {
                  pkgs = pkgsBySystem."${system}";
                };
                # for compat with nix-shell, nix-build, etc
                environment.etc.nixpkgs.source = inputs.nixpkgs;
                nix.nixPath = [ "nixpkgs=/etc/nixpkgs" ];
              }
            )
            (
              { lib, ... }:
              {
                system.configurationRevision = lib.mkIf (self ? rev) self.rev;
              }
            )
            (import ./hosts/${host})
            inputs.lix-module.nixosModules.default
            inputs.nix-index-database.nixosModules.nix-index
          ];
          specialArgs = { inherit name inputs; };
        });

      mkHomeManagerConfiguration =
        name:
        {
          system,
          host,
          config,
        }:
        nameValuePair name (
          { ... }:
          {
            imports = [
              (import ./home)
              (import config)
            ];
            home = {
              file.".nixpkgs".source = inputs.nixpkgs;
              sessionVariables."NIX_PATH" = "nixpkgs=$HOME/.nixpkgs\${NIX_PATH:+:}$NIX_PATH";
            };
            xdg.configFile."nixpkgs/config.nix".source = ./nix/config.nix;
          }
        );

      mkHomeManagerHostConfiguration =
        name:
        {
          system,
          configName ? name,
          username ? "jan",
        }:
        nameValuePair name (
          inputs.home-manager.lib.homeManagerConfiguration {
            modules = [
              (self.internal.homeManagerConfigurations."${configName}")
              (
                { pkgs, ... }:
                {
                  xdg.configFile."nix/nix.conf".text =
                    let
                      nixConf = import ./nix/conf.nix;
                      substituters = nixConf.binaryCaches;
                      trustedPublicKeys = nixConf.binaryCachePublicKeys;
                    in
                    ''
                      experimental-features = nix-command flakes
                      substituters = ${builtins.concatStringsSep " " substituters}
                      trusted-public-keys = ${builtins.concatStringsSep " " trustedPublicKeys}
                    '';
                  nixpkgs = {
                    config = import ./nix/config.nix;
                    overlays = self.internal.overlays."${system}";
                  };
                }
              )
            ];
            pkgs = pkgsBySystem."${system}";
          }
        );

    in
    {
      internal = {
        homeManagerConfigurations = mapAttrs' mkHomeManagerConfiguration {
          janXPS = {
            system = "x86_64-linux";
            host = "xps";
            config = ./home/janXPS.nix;
          };
          janRBS = {
            system = "x86_64-linux";
            host = "rbs";
            config = ./home/janRBS.nix;
          };
        };
        overlays = forEachSystem (system: [ ]);
      };
      homeManagerConfigurations = mapAttrs' mkHomeManagerHostConfiguration { };
      nixosConfigurations = mapAttrs' mkNixOsConfiguration {
        xps = {
          system = "x86_64-linux";
        };
        rbs = {
          system = "x86_64-linux";
        };
      };
    };
}
