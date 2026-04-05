{ self, config, pkgs, ... }:

{
  flake.nixosModules.conf_niri = { pkgs, ... }: {

    home-manager.users.${config.username} = {
      xdg.configFile."niri/config.kdl".source = ./extra-config.kdl;
    };
  };
}
