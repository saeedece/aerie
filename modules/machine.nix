{ config, lib, ... }:
{
  options = {

    type = lib.mkOption {
      type = lib.types.str;
      default = "server";
    };

    isLaptop = lib.mkOption {
      type = lib.types.bool;
      default = config.type == "laptop";
      readOnly = true;
    };

    isDesktop = lib.mkOption {
      type = lib.types.bool;
      default = config.type == "desktop";
      readOnly = true;
    };

    isServer = lib.mkOption {
      type = lib.types.bool;
      default = config.type == "server";
      readOnly = true;
    };
  };
}
