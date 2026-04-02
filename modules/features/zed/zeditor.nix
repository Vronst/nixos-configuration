{ self, config, pkgs, ... }:

{
  flake.nixosModules.zed = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.zed-editor ];
  };
}
