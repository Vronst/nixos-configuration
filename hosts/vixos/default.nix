{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./configuration.nix
      ./hardware-configuration.nix
      ./users.nix
      ../../modules/IDE/zed
      ../../modules/IDE/nvim
      ../../modules/git
      ../../modules/niri
      ../../modules/homeManager/home.nix
      ../../modules/homeManager/aliases.nix
      ../../modules/git
      # ../../modules/git/git_conf.nix
      ../../modules/git/gpg.nix
    ];
}
