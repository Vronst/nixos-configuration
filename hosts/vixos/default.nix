{ config, pkgs, ... }:

{
  imports =
    [
      ./configuration.nix

      ./hardware-configuration.nix

      ./users.nix

      ../../modules/IDE/zed
      ../../modules/IDE/zed/home_config.nix

      ../../modules/IDE/nvim

      ../../modules/versionControl
      ../../modules/versionControl/gpg.nix

      ../../modules/niri
      ../../modules/niri/home_config.nix
      ../../modules/niri/utils.nix

      ../../modules/noctalia
      ../../modules/noctalia/home_config.nix

      ../../modules/homeManager/home.nix
      ../../modules/homeManager/aliases.nix

      ../../modules/discord
      ../../modules/steam
    ];
}
