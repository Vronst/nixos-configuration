{ self, lib, ... }:
{
  flake.nixosModules.identity = {
    options = {
      username = lib.mkOption {
        type = lib.types.str;
        default = "vronst";
        description = "Username for home-manager to use for different machines";
      };
    };
  };
}
