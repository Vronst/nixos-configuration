{ config, pkgs, ... }:
{
  imports =
    [
      ./configuration.nix

      ./hardware-configuration.nix

      ./users.nix

      ../../modules/IDE/nvim

      ../../modules/versionControl
      ../../modules/versionControl/gpg.nix

      ../../modules/homeManager/home.nix
      ../../modules/homeManager/aliases.nix
      ../../modules/homeManager/alwaysOn.nix

      ../../modules/containers

      ../../modules/ssh/home_config.nix

      ../../modules/ssh/openssh.nix
    ];
}
