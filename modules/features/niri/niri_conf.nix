{ self, config, pkgs, ... }:

{
  flake.nixosModules.conf_niri = { pkgs, ... }: {

    home-manager.users.vronst = {
      xdg.configFile."niri/config.kdl".source = ./extra-config.kdl;
    };
  };
}
