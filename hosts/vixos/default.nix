{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./configuration.nix

      ./hardware-configuration.nix

      ./users.nix

      ../../modules/IDE/zed
      ../../modules/IDE/zed/home_config.nix

      ../../modules/IDE/nvim

      ../../modules/git

      ../../modules/niri
      ../../modules/niri/home_config.nix

      ../../modules/homeManager/home.nix
      ../../modules/homeManager/aliases.nix

      ../../modules/git/gpg.nix
    ];
}
