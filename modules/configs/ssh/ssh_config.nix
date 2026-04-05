{ self, config, pkgs, ... }:

{
  flake.nixosModules.conf_ssh = { pkgs, ... }: {

    home-manager.users.${config.username} = {
      home.file.".ssh/config".source = ./config;
    };
  };
}
