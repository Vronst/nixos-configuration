{ self, lib, config, inputs, ... }:
let
  user = config._module.args.user;
in
{
  flake.nixosModules.homeManager = {
    home-manager = {
      extraSpecialArgs = { inherit inputs; user = config._module.args.user;};
      useGlobalPkgs = true;
      useUserPackages = true;
      users.${user}.home.stateVersion = "25.11";
    };

    imports = [
            # conf files
            self.nixosModules.conf_zed
            self.nixosModules.conf_ssh
    ];
  };
}
