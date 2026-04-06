{ self, config, pkgs, ... }:

{
  flake.nixosModules.conf_ssh = { pkgs, ... }: {

    home-manager.users.${config._module.args.user} = {
      home.file.".ssh/config".source = ./config;
    };
  };
}
