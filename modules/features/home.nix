{ self, lib, config, inputs, user, ... }:
{
  flake.nixosModules.homeManager = {
    home-manager.extraSpecialArgs = { inherit inputs self;};
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.vronst.home.stateVersion = "25.11";
  };
}
