{ self, config, pkgs, ... }:

{
  flake.nixosModules.conf_zed = { pkgs, ... }: {

    home-manager.users.${config.username} = {
      xdg.configFile."zed/settings.json".source = ./settings.json;
      xdg.configFile."zed/keymap.json".source = ./keymap.json;
    };
  };
}
