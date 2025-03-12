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

  round =
    x:
    let
      dec = x - builtins.floor x;
      flag = dec < 0.5;
      res = if flag then (builtins.floor x) else (builtins.ceil x);
    in
    res;
in
{
  inherit round;
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
