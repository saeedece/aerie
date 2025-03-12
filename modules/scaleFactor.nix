{ config, lib, ... }:
{
  options = {
    scaleFactor = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
    };
  };
}
