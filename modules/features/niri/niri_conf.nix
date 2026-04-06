{ self, config, pkgs, ... }:

{
  flake.nixosModules.conf_niri = { pkgs, ... }: {

    home-manager.users.${config._module.args.user} = {
      xdg.configFile."niri/config.kdl".source = ./extra-config.kdl;
    };
  };
}
