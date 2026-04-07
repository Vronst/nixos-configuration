{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./configuration.nix
      ./hardware-configuration.nix
      ../../modules/IDE/zed
      ../../modules/IDE/nvim
      ../../modules/git
    ];
}
