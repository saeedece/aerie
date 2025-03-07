inputs: self: super:
let
  inherit (self)
    filter
    hasSuffix
    ;

  inherit (self.filesystem) listFilesRecursive;

  collectNix = path: filter (hasSuffix ".nix") (listFilesRecursive path);
  myModules = collectNix ../modules;

  inputModules = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index-database.nixosModules.nix-index
    inputs.lix-module.nixosModules.default
  ];
  inputOverlays = [ ];

  specialArgs = {
    inherit inputs;
  };

in
{
  nixosSystem =
    module:
    super.nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      modules =
        [
          module
          ({ nixpkgs.overlays = inputOverlays; })
        ]
        ++ myModules
        ++ inputModules;
    };
}
