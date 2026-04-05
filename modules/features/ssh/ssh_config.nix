{ self, config, pkgs, ... }:

{
  flake.nixosModules.conf_ssh = { pkgs, ... }: {

    home-manager.users.vronst = {
      home.file.".ssh/config".source = ./config;
    };
  };
}
